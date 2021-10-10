# to work with PostgreSQL database
import psycopg2
from psycopg2 import sql
# to work with GUI
import tkinter as tk
import tkinter.ttk as ttk
import pygubu
# to work with graphs
import networkx as nx
# to work with JSON
import json
# to work with dictionaries
from functools import reduce

# Connection to PostgreSQL database
# don't forget to replace 'database_name', 'user_name' and 'user_password'
conn = psycopg2.connect(
    dbname='database_name',
    user='user_name',
    password='user_password'
)
# To open a cursor to perform database operations
cur = conn.cursor()

# Array for application log related to the design process of the system and its devices
log_array = {}
# Predefined number of wheels that designed robot should have
wheel_number = 2
# Predefined number of KB of flash memory that are required to work with 1 electronic component
EC_FLASH = 10
# Dictionary with the model of the designed system from abstract to concrete one
abstract_system_composition = {}
# Index to control generation of log buttons as well as their position on GUI
btn_index = 0
# Boolean variable to control the involvement of the operator in the design process
automatic_mode_flag = False
# Array for generated log buttons
log_buttons_array = []

# Array of "CONFIRM" buttons that are generated during the selection process
select_btns = []
# Array of comboboxes with alternatives of elements that are generated during the selection process
select_cbs = []
# Dictionary with data about each step of the selection process
select_dict = {}

# Dictionary with data about dependencies between elements during the selection process
select_deps = {}

# Index to control the number of step of the selection process
select_step = 1
# Dictionary with data about elements that can't be selected and need to be developed
develop_dict = {}
#
step_index = 0


# One of functions for the replacement of elements of the designed system model
# It is used to replace elements of devices after their selection
def get_nested(d, keys):
    return reduce(dict.get, [d] + keys)


# One of functions for the replacement of elements of the designed system model
# It is used to replace elements of devices after their selection
def set_nested(d, keys, value):
    get_nested(d, keys[:-1])[keys[-1]] = value


# Recursive function for the extraction of the elements from the abstract constructed hierarchical model
# It is used to form an input for the selection dictionary
def recursive(element, el_dict, hierarchy_part):
    if list(element['components'].values()):
        el_keys = list(element['components'].keys())

        for key in el_keys:
            el_dict[key] = {}

        for key in el_keys:
            temp_hierarchy = hierarchy_part

            el_dict[key]["id"] = element['components'][key]["id"]
            el_dict[key]["name"] = element['components'][key]["name"]

            if "parent" in element['components'][key]:
                parent = element['components'][key]["parent"]
                temp_hierarchy = hierarchy_part.partition(parent)[0] + hierarchy_part.partition(parent)[1]

            temp_hierarchy += "->" + key
            el_dict[key]["hierarchy"] = temp_hierarchy

            el_dict[key]["dependencies"] = element['components'][key]["dependencies"]
            el_dict[key]["requirements"] = element['components'][key]["requirements"]

            el_dict = recursive(element['components'][key], el_dict, temp_hierarchy)

    return el_dict


def abstract_model_initialization():
    global abstract_system_composition

    abstract_system_composition["devices"] = {}
    abstract_system_composition["recommendations"] = {}
    abstract_system_composition["links"] = {}


def abstract_model_system_recommendations(system_recommendations):
    global abstract_system_composition

    index = 0
    for recommendation in system_recommendations["system"]:
        index += 1
        abstract_system_composition["recommendations"][
            "recommendation_" + str(index)] = {}
        abstract_system_composition["recommendations"][
            "recommendation_" + str(index)]["id"] = recommendation[0]
        abstract_system_composition["recommendations"][
            "recommendation_" + str(index)]["name"] = recommendation[1]


def abstract_model_device_initialization(key, device_name, index):
    global abstract_system_composition

    abstract_system_composition["devices"][key] = {}
    abstract_system_composition["devices"][key]["id"] = index
    abstract_system_composition["devices"][key]["name"] = device_name
    abstract_system_composition["devices"][key]["components"] = {}
    abstract_system_composition["devices"][key]["recommendations"] = {}


def abstract_model_device_recommendations(key, recommendation, index):
    global abstract_system_composition

    index += 1
    abstract_system_composition["devices"][key]["recommendations"][
        "recommendation_" + str(index)] = {}
    abstract_system_composition["devices"][key]["recommendations"][
        "recommendation_" + str(index)]["id"] = recommendation[0]
    abstract_system_composition["devices"][key]["recommendations"][
        "recommendation_" + str(index)]["name"] = recommendation[1]

    return index


def abstract_model_electronic_component_initialization(
        device_key, element_key, element_id, element_name
):
    global abstract_system_composition

    abstract_system_composition["devices"][device_key]["components"][
        element_key] = {}
    abstract_system_composition["devices"][device_key]["components"][
        element_key]["id"] = element_id
    abstract_system_composition["devices"][device_key]["components"][
        element_key]["name"] = element_name
    abstract_system_composition["devices"][device_key]["components"][
        element_key]["components"] = {}
    abstract_system_composition["devices"][device_key]["components"][
        element_key]["links"] = {}
    abstract_system_composition["devices"][device_key]["components"][
        element_key]["requirements"] = {}
    abstract_system_composition["devices"][device_key]["components"][
        element_key]["dependencies"] = {}


def flash_memory_calculations(req_id, flash_memory):
    cur.execute(
        "SELECT value FROM abstract_subelements_and_flash_memory "
        "WHERE element_id = %s",
        (req_id,)
    )
    memory_value = cur.fetchall()

    if len(memory_value) > 0:
        flash_memory += memory_value[0][0]

    return flash_memory


def abstract_model_electronic_components_requirements(
        abstract_system_arr, device, device_key,
        element, element_id, element_key,
        electronic_components_count
):
    global abstract_system_composition

    index_req = 0
    flash_memory_size = 0

    for requirement in abstract_system_arr[device][element]:
        index_req += 1
        requirement_key = "requirement_" + str(index_req)

        # Flash memory size calculations for firmwares of microcontrollers
        if element_id in {19, 20}:
            flash_memory_size = \
                flash_memory_calculations(requirement[0], flash_memory_size)

        abstract_system_composition["devices"][device_key]["components"][
            element_key]["requirements"][requirement_key] = {}
        abstract_system_composition["devices"][device_key]["components"][
            element_key]["requirements"][requirement_key]['id'] = requirement[0]
        abstract_system_composition["devices"][device_key]["components"][
            element_key]["requirements"][requirement_key]['name'] = requirement[1]

    if flash_memory_size > 0:
        # Insert of flash memory size requirement if any -> start
        # special calculation for
        # (24 , electronic components interaction algorithm)
        # in (19, firmware for electronic components)
        if element_id == 19:
            flash_memory_size += electronic_components_count * EC_FLASH

        abstract_system_composition["devices"][device_key]["components"][
            element_key]["requirements"]["flash_kb"] = flash_memory_size
        # Insert of flash memory size requirement if any -> end


def insert_count_calculation(element):
    insert_count = 1

    if element == (14, 'wireless signal transmitter'):
        insert_count = 2

    if element == (15, 'encoder'):
        insert_count = wheel_number

    if element == (6, 'collector motor'):
        insert_count = wheel_number

    return insert_count


def get_electronic_components_count(element_id, electronic_components_count):
    cur.execute(
        "SELECT * FROM abstract_elements_and_types "
        "WHERE element_id = %s AND type_id = %s",
        (element_id, 4,)
    )
    electronic_component_or_not = cur.fetchall()

    if len(electronic_component_or_not) > 0:
        electronic_components_count += 1

    return electronic_components_count


def abstract_model_device_components_list(
        abstract_system_arr, device, device_key, index_dev
):
    index_elem = 0
    elements_list = list()
    electronic_components_count = 0

    for element in abstract_system_arr[device]:
        element_id = element[0]
        element_name = element[1]

        insert_count = insert_count_calculation(element)
        electronic_components_count = \
            get_electronic_components_count(
                element_id,
                electronic_components_count
            )

        # Insert of electronic components of the device
        for index in range(0, insert_count):
            index_elem += 1
            element_key = "element_" + str(index_elem)

            # Initialization of electronic component
            abstract_model_electronic_component_initialization(
                device_key, element_key, element_id, element_name
            )

            # Collecting elements dictionary keys for each device
            elements_list.append(
                [index_dev, device_key, element_key, element_id]
            )

            # Insert of electronic component requirements
            abstract_model_electronic_components_requirements(
                abstract_system_arr, device, device_key,
                element, element_id, element_key,
                electronic_components_count
            )

    return elements_list


def abstract_model_devices(system_recommendations, abstract_system_arr):
    global abstract_system_composition

    index_dev = 0
    device_keys = {}
    devices_elements_keys = {}

    for device in abstract_system_arr:
        index_dev += 1
        device_key = "device_" + str(index_dev)
        device_keys[device] = device_key

        # 3.1
        abstract_model_device_initialization(device_key, device, index_dev)

        index_rec = 0
        for recommendation in system_recommendations[device]:
            # 3.2
            index_rec = \
                abstract_model_device_recommendations(device_key, recommendation, index_rec)

        # 3.3. Formation of device components list
        elements_list = \
            abstract_model_device_components_list(
                abstract_system_arr, device, device_key, index_dev
            )

        # Saving elements dictionary keys for each device
        devices_elements_keys[device] = elements_list

    return device_keys, devices_elements_keys


def abstract_model_links_linked_or_not(ability_1, ability_2):
    cur.execute(
        "SELECT * FROM devices_are_linked "
        "WHERE ability_1 = %s AND ability_2 = %s",
        (ability_1, ability_2)
    )
    linked_or_not_arr = cur.fetchall()

    return linked_or_not_arr


def abstract_model_links_link_initialization(
        ability_1, ability_2, links_dep_elements,
        party_1, party_2, type_id
):
    global abstract_system_composition

    dict_key = "link_" + str(ability_1) + str(ability_2)

    if dict_key not in links_dep_elements:
        links_dep_elements[dict_key] = set()

    if dict_key not in abstract_system_composition["links"]:
        abstract_system_composition["links"][dict_key] = {}
        abstract_system_composition["links"][dict_key][
            "id"] = ability_1 * 10 + ability_2
        abstract_system_composition["links"][dict_key][
            "type"] = type_id
        abstract_system_composition["links"][dict_key][
            "parties"] = {}
        abstract_system_composition["links"][dict_key][
            "dependencies"] = {}
        abstract_system_composition["links"][dict_key][
            "requirements"] = {}

    temp_part = abstract_system_composition["links"][dict_key]["parties"]

    if party_1 not in temp_part:
        temp_part[party_1] = {}

    if party_2 not in temp_part[party_1]:
        temp_part[party_1][party_2] = {}

    abstract_system_composition["links"][dict_key]["parties"] = temp_part

    temp_dep = abstract_system_composition["links"][dict_key]["dependencies"]
    temp_dep_elem_set = links_dep_elements[dict_key]

    return temp_dep, temp_dep_elem_set, dict_key, links_dep_elements


def abstract_model_links_link_dependable_get(ability_1, ability_2):
    cur.execute(
        "SELECT element_id FROM links_and_dependencies "
        "WHERE ability_1 = %s AND ability_2 = %s",
        (ability_1, ability_2,)
    )
    elements_that_depend = cur.fetchall()

    return elements_that_depend


def abstract_model_links_link_dependencies_formation(
        elements_that_depend,
        devices_elements_keys, device_1, device_2,
        temp_dep, temp_dep_elem_set,
        dict_key, links_dep_elements
):
    global abstract_system_composition

    for element in elements_that_depend:
        for element_1 in devices_elements_keys[device_1]:
            if element[0] == element_1[3]:
                dep_key = "dependency_" + str(element_1[0]) + str(element_1[3])

                if dep_key not in temp_dep:
                    temp_dep[dep_key] = {}
                    temp_dep[dep_key]["device_key"] = element_1[1]
                    temp_dep[dep_key]["element_key"] = element_1[2]

                    temp_dep_elem_set.add(element_1[3])

        for element_2 in devices_elements_keys[device_2]:
            if element[0] == element_2[3]:
                dep_key = "dependency_" + str(element_2[0]) + str(element_2[3])

                if dep_key not in temp_dep:
                    temp_dep[dep_key] = {}
                    temp_dep[dep_key]["device_key"] = element_2[1]
                    temp_dep[dep_key]["element_key"] = element_2[2]

                    temp_dep_elem_set.add(element_2[3])

    abstract_system_composition["links"][dict_key]["dependencies"] = temp_dep
    links_dep_elements[dict_key] = temp_dep_elem_set

    return links_dep_elements


def abstract_model_links(
        device_keys, devices_elements_keys, abstract_links_arr
):
    global abstract_system_composition

    already_checked_set = set()
    links_dep_elements = {}

    for device_1 in abstract_links_arr:
        for device_2 in abstract_links_arr:
            if device_1 != device_2 and device_2 not in already_checked_set:

                party_1 = device_keys[device_1]
                links_1 = abstract_links_arr[device_1]

                party_2 = device_keys[device_2]
                links_2 = abstract_links_arr[device_2]

                for link_1 in links_1:
                    for link_2 in links_2:

                        ability_1 = link_1[2]
                        type_id = link_1[1]
                        ability_2 = link_2[2]

                        # Checking of there is a link between two devices based on their abilities
                        # 4.1
                        linked_or_not_arr = \
                            abstract_model_links_linked_or_not(ability_1, ability_2)

                        # Formation of a link between devices
                        if len(linked_or_not_arr) > 0:
                            # 4.2
                            temp_dep, temp_dep_elem_set, dict_key, links_dep_elements = \
                                abstract_model_links_link_initialization(
                                    ability_1, ability_2, links_dep_elements,
                                    party_1, party_2, type_id
                                )

                            # 4.3. Getting device abstract elements which selection depends on links
                            elements_that_depend = \
                                abstract_model_links_link_dependable_get(ability_1, ability_2)

                            # 4.4. Formation of dependencies between links and device elements
                            # in abstract system model
                            links_dep_elements = \
                                abstract_model_links_link_dependencies_formation(
                                    elements_that_depend,
                                    devices_elements_keys, device_1, device_2,
                                    temp_dep, temp_dep_elem_set,
                                    dict_key, links_dep_elements
                                )

            already_checked_set.add(device_1)

    return links_dep_elements


def abstract_model_links_requirements(
        links_dep_elements, system_security_elements_set
):
    global abstract_system_composition

    for link_key in links_dep_elements:

        for element_id in links_dep_elements[link_key]:
            # (4, wireless charge receiver)
            # (5, battery)
            # (13, wireless charge transmitter)
            if element_id in {4, 5, 13}:
                abstract_system_composition["links"][link_key][
                    "requirements"]["wireless"] = "true"
                abstract_system_composition["links"][link_key][
                    "requirements"]["charge"] = "true"

            # (12, wireless signal receiver)
            # (14, wireless signal transmitter)
            if element_id in {12, 14}:
                abstract_system_composition["links"][link_key][
                    "requirements"]["wireless"] = "true"
                abstract_system_composition["links"][link_key][
                    "requirements"]["signal"] = "true"

            # (16, one-board computer)
            # (18, microcontroller for wireless communication)
            # (25, wireless access point)
            if element_id in {16, 18, 25}:
                abstract_system_composition["links"][link_key][
                    "requirements"]["wireless"] = "true"
                abstract_system_composition["links"][link_key][
                    "requirements"]["data"] = "true"

                for security_element in system_security_elements_set:
                    # (9, data encryption)
                    if security_element in {9}:
                        abstract_system_composition["links"][link_key][
                            "requirements"]["encryption"] = "true"

                    # (10, mutual authentication)
                    if security_element in {10}:
                        abstract_system_composition["links"][link_key][
                            "requirements"]["authentication"] = "true"

            # (25, wireless access point)
            if element_id in {25}:
                abstract_system_composition["links"][link_key][
                    "requirements"]["access_point"] = "true"


def abstract_model_devices_dependencies_and_requirements():
    global abstract_system_composition

    for device in abstract_system_composition["devices"]:
        # Initialization -> start
        temp_dict = abstract_system_composition["devices"][device]["components"]
        pins_count = 0
        mc_key = ''
        # Initialization -> end

        # Checking each pair of components for dependencies -> start
        for key_1 in temp_dict:
            # Getting components ids -> start
            id_1 = temp_dict[key_1]["id"]

            if id_1 == 17:
                mc_key = key_1

            for key_2 in temp_dict:
                if key_1 != key_2:
                    id_2 = temp_dict[key_2]["id"]
                    # Getting components ids -> end

                    # Getting dependencies between two components -> start
                    cur.execute(
                        "SELECT * FROM abstract_elements_and_dependencies "
                        "WHERE element_1 = %s AND element_2 = %s",
                        (id_1, id_2,)
                    )
                    dependency_exists = cur.fetchall()

                    if len(dependency_exists) > 0:
                        temp_dict[key_1]["dependencies"][key_2] = {}
                    # Getting dependencies between two components -> end

            # Checking each pair of components for dependencies -> end

            # Getting number of pins that are required on device microcontroller -> start
            cur.execute(
                "SELECT count FROM abstract_elements_and_pins "
                "WHERE element_id = %s",
                (id_1,)
            )
            number_of_pins = cur.fetchall()

            if len(number_of_pins) > 0:
                pins_count += number_of_pins[0][0]
            # Getting number of pins that are required on device microcontroller -> end

        # Saving number of pins requirement
        if pins_count > 0:
            temp_dict[mc_key]["requirements"]["pins"] = pins_count

        # Saving dependencies and requirements to abstract model
        abstract_system_composition["devices"][device]["components"] = temp_dict


def abstract_model_devices_hierarchy_graph_nodes(
        device_assoc, device_components_graph, elements_keys
):
    for key in device_assoc["components"]:
        component_id = device_assoc["components"][key]["id"]
        component_assoc = device_assoc["components"][key]
        elements_keys[key] = component_assoc["id"]

        node = (component_id, key)
        device_components_graph.add_node(node)

    return device_components_graph, elements_keys


def abstract_model_devices_hierarchy_graph_edges(
        device_assoc, device_components_graph, elements_keys
):
    for key in device_assoc["components"]:
        component_assoc = device_assoc["components"][key]
        component_id = component_assoc["id"]

        temp_ids = []
        for iden in elements_keys:
            temp_ids.append(elements_keys[iden])

        cur.execute(
            "SELECT element_2 FROM abstract_elements_combination "
            "WHERE element_1 = %s AND element_2 = ANY(%s)",
            (component_id, temp_ids,)
        )
        subcomponents_ids = cur.fetchall()

        for subcomponent in subcomponents_ids:
            subcomponent_id = subcomponent[0]

            for iden in elements_keys:
                if elements_keys[iden] == subcomponent_id:
                    node_1 = (component_id, key)
                    node_2 = (subcomponent_id, iden)
                    device_components_graph.add_edge(node_1, node_2)

    return device_components_graph, elements_keys


def abstract_model_devices_hierarchy_graph_edges_remove(device_components_graph):
    edges_to_remove = list()

    for edge_1 in device_components_graph.edges:
        # when battery (5) can be connected to microcontroller (17) or motor shield (22)
        # it is better to connect it to motor shield
        if edge_1[0][0] == 17 and edge_1[1][0] == 5:
            for edge_2 in device_components_graph.edges:
                if edge_2[0][0] == 22 and edge_2[1][0] == 5:
                    edges_to_remove.append(edge_1)
                    # device_components_graph.remove_edge(edge_1[0], edge_1[1])

        # when troyka shield (23) can be connected to microcontroller or motor shield (22)
        # it is better to connect it to motor shield
        if edge_1[0][0] == 17 and edge_1[1][0] == 23:
            for edge_2 in device_components_graph.edges:
                if edge_2[0][0] == 22 and edge_2[1][0] == 23:
                    # device_components_graph.remove_edge(edge_1[0], edge_1[1])
                    edges_to_remove.append(edge_1)

    # in the future it would be better to add an algorithm that detects and removes
    # such structures from directed graph based on priorities of elements
    # but for now it is based on rules
    for edge in edges_to_remove:
        device_components_graph.remove_edge(edge[0], edge[1])

    return device_components_graph


def abstract_model_devices_hierarchy_building_parent(
        device, component_key, parent_key
):
    global abstract_system_composition

    abstract_system_composition["devices"][device][
        "components"][component_key]["parent"] = parent_key

    parent_id = abstract_system_composition["devices"][device][
        "components"][parent_key]["id"]
    component_id = abstract_system_composition["devices"][device][
        "components"][component_key]["id"]

    return parent_id, component_id


def abstract_model_devices_hierarchy_building_requirements(
        component_id,
        device, component_key, parent_key,
        motors_count
):
    global abstract_system_composition

    # firmware
    if component_id in {19, 20}:
        if "flash_kb" in abstract_system_composition["devices"][device][
            "components"][component_key]["requirements"]:
            # moving flash memory size requirement to microcontroller
            abstract_system_composition["devices"][device]["components"][
                parent_key]["requirements"]["flash_kb"] = \
                abstract_system_composition["devices"][device][
                    "components"][component_key]["requirements"]["flash_kb"]
            del abstract_system_composition["devices"][device][
                "components"][component_key]["requirements"]["flash_kb"]
        # else:
        #     print(
        #         abstract_system_composition["devices"][device][
        #             "components"][component_key]["requirements"]
        #     )

    # collector motor
    if component_id == 6:
        motors_count += 1
        # forming requirement to number of motors to motor shield
        abstract_system_composition["devices"][device]["components"][
            parent_key]["requirements"]["motors"] = motors_count

    return motors_count


def abstract_model_devices_hierarchy_building_components(
        device, component_key, parent_key
):
    global abstract_system_composition

    abstract_system_composition["devices"][device][
        "components"][parent_key]["components"][component_key] = \
        abstract_system_composition["devices"][device][
            "components"][component_key]


def abstract_model_devices_hierarchy_building_links(
        parent_id, component_id,
        device, component_key, parent_key
):
    global abstract_system_composition

    cur.execute(
        "SELECT id, name FROM abstract_links "
        "WHERE id IN("
        "SELECT link_id FROM abstract_links_and_elements "
        "WHERE element_1 = %s AND element_2 = %s"
        ")",
        (parent_id, component_id,)
    )
    link = cur.fetchall()

    link_key = "link_" + str(link[0][0])
    temp_links_dict = abstract_system_composition["devices"][device][
        "components"][parent_key]["links"]

    if link_key not in temp_links_dict:
        temp_links_dict[link_key] = {}
        temp_links_dict[link_key]["id"] = link[0][0]
        temp_links_dict[link_key]["type"] = link[0][1]
        temp_links_dict[link_key]["parties"] = {}

    temp_parties_dict = temp_links_dict[link_key]["parties"]

    if component_key not in temp_parties_dict:
        temp_parties_dict[component_key] = {}

    temp_links_dict[link_key]["parties"] = temp_parties_dict

    abstract_system_composition["devices"][device][
        "components"][parent_key]["links"] = temp_links_dict


def abstract_model_devices_hierarchy_building(
        device_components_graph, device
):
    global abstract_system_composition

    composition_flag = True
    motors_count = 0
    root_node = list(nx.topological_sort(device_components_graph))[0]

    while composition_flag:
        # Initialization
        components_path_dict = nx.shortest_path_length(device_components_graph, root_node)
        components_list = list(components_path_dict.keys())

        # Getting child element of the lowest level
        temp_component = components_list[len(components_list) - 1]

        # Checking if this element has predecessors
        if len(list(device_components_graph.predecessors(temp_component))) > 0:
            # Getting parent
            temp_parent = list(device_components_graph.predecessors(temp_component))[0]

            component_key = temp_component[1]
            parent_key = temp_parent[1]

            # Inserting data about parent of the element into abstract model of the system
            parent_id, component_id = \
                abstract_model_devices_hierarchy_building_parent(
                    device, component_key, parent_key
                )

            if component_id in {19, 20, 6}:
                # 7.4.1
                motors_count = \
                    abstract_model_devices_hierarchy_building_requirements(
                        component_id,
                        device, component_key, parent_key,
                        motors_count
                    )

            # 7.4.2 Insertion of the abstract component data into "components" part of another component
            abstract_model_devices_hierarchy_building_components(
                device, component_key, parent_key
            )

            # 7.4.3 Formation of links between device components
            abstract_model_devices_hierarchy_building_links(
                parent_id, component_id,
                device, component_key, parent_key
            )

            # Removing inserted component from components of device
            del abstract_system_composition["devices"][device]["components"][component_key]
            # Removing related to inserted component node from graph
            device_components_graph.remove_node(temp_component)

            # Completion of the process
            if device_components_graph.number_of_nodes() == 1:
                composition_flag = False

        # Completion of the process
        else:
            composition_flag = False


def abstract_model_devices_hierarchy():
    global abstract_system_composition

    for device in abstract_system_composition["devices"]:
        device_assoc = abstract_system_composition["devices"][device]
        device_components_graph = nx.DiGraph()
        elements_keys = {}

        # 7.1
        device_components_graph, elements_keys = \
            abstract_model_devices_hierarchy_graph_nodes(
                device_assoc, device_components_graph, elements_keys
            )

        # 7.2
        device_components_graph, elements_keys = \
            abstract_model_devices_hierarchy_graph_edges(
                device_assoc, device_components_graph, elements_keys
            )

        # 7.3
        device_components_graph = \
            abstract_model_devices_hierarchy_graph_edges_remove(device_components_graph)

        # 7.4
        abstract_model_devices_hierarchy_building(
            device_components_graph, device
        )


def attacker_actions_get(
        log_str,
        access_type, knowledge_type, resources_type
):
    cur.execute(
        "SELECT attack_actions.id, attack_actions.name, attack_actions.description "
        "FROM attackers_and_actions, attack_actions "
        "WHERE attackers_and_actions.action_id = attack_actions.id "
        "AND attackers_and_actions.access_id <= %s "
        "AND attackers_and_actions.knowledge_id <= %s "
        "AND attackers_and_actions.resources_id <= %s",
        (access_type, knowledge_type, resources_type)
    )
    attacker_actions = cur.fetchall()

    log_str += "Attack actions that are possible for the selected attacker:\n"
    for action in attacker_actions:
        log_str += "- " + action[1] + ": " + action[2] + "\n"

    return log_str, attacker_actions


def system_security_elements_get(
        log_str,
        attacker_actions, system_security_elements_set
):
    log_str += "\nNext security elements should be used to prevent attack actions:\n"

    for action in attacker_actions:

        cur.execute(
            "SELECT security_elements.id, security_elements.name "
            "FROM security_and_actions, security_elements "
            "WHERE security_and_actions.element_id = security_elements.id "
            "AND security_and_actions.action_id = %s",
            (action[0],)
        )
        security_elements = cur.fetchall()

        log_str += "- " + action[1] + ": "

        temp_str = ""
        for element in security_elements:
            temp_str += element[1] + ", "
            system_security_elements_set.add(element[0])

        temp_str = temp_str[:-2] + "\n"
        log_str += temp_str

    return log_str, system_security_elements_set


def system_abilities_get(log_str, task_1, task_2, task_3):
    cur.execute(
        "SELECT system_abilities.id, system_abilities.name "
        "FROM system_tasks_and_abilities, system_abilities "
        "WHERE system_tasks_and_abilities.ability_id = system_abilities.id "
        "AND system_tasks_and_abilities.task_id IN(%s, %s, %s)",
        (task_1, task_2, task_3,)
    )
    system_abilities = cur.fetchall()

    log_str += "\nAbilities, formed based on the provided tasks:\n"

    for ability in system_abilities:
        log_str += "- " + ability[1] + "\n"

    return log_str, system_abilities


def system_requirements_get(log_str, system_abilities):
    abilities_ids = []
    for ability in system_abilities:
        abilities_ids.append(ability[0])

    cur.execute(
        "SELECT system_requirements.id, system_requirements.name "
        "FROM system_abilities_and_requirements, system_requirements "
        "WHERE system_abilities_and_requirements.requirement_id = system_requirements.id "
        "AND system_abilities_and_requirements.ability_id = ANY(%s) "
        "GROUP BY system_requirements.id ORDER BY system_requirements.id",
        (abilities_ids,)
    )
    system_requirements = cur.fetchall()

    log_str += "\nRequirements, formed based on the provided abilities:\n"

    for requirement in system_requirements:
        log_str += "- " + requirement[1] + "\n"

    return log_str, system_requirements


def device_tasks_get(log_str, req_str, requirement):
    log_str += "The next tasks were formed for the " + req_str + ":\n"

    cur.execute(
        "SELECT device_tasks.id, device_tasks.name "
        "FROM system_requirements_and_tasks, device_tasks "
        "WHERE system_requirements_and_tasks.task_id = device_tasks.id "
        "AND system_requirements_and_tasks.requirement_id = %s "
        "ORDER BY device_tasks.id",
        (requirement,)
    )
    device_tasks = cur.fetchall()

    for task in device_tasks:
        log_str += "- " + task[1] + "\n"

    return log_str, device_tasks


def device_abilities_get(log_str, requirement):
    log_str += "\nAbilities, formed based on the provided tasks:\n"

    cur.execute(
        "SELECT device_tasks_and_abilities.ability_id, device_abilities.name "
        "FROM device_tasks_and_abilities, device_abilities "
        "WHERE device_tasks_and_abilities.ability_id = device_abilities.id AND "
        "device_tasks_and_abilities.requirement_id = %s",
        (requirement,)
    )
    device_abilities = cur.fetchall()

    for ability in device_abilities:
        log_str += "- " + ability[1] + "\n"

    return log_str, device_abilities


def device_requirements_get(log_str, device_abilities):
    log_str += "\nRequirements, formed based on the provided abilities:\n"

    abilities_ids = []
    for ability in device_abilities:
        abilities_ids.append(ability[0])

    cur.execute(
        "SELECT DISTINCT device_abilities_and_requirements.requirement_id, device_requirements.name "
        "FROM device_abilities_and_requirements, device_requirements "
        "WHERE device_abilities_and_requirements.requirement_id = device_requirements.id AND "
        "device_abilities_and_requirements.ability_id = ANY(%s) "
        "ORDER BY device_abilities_and_requirements.requirement_id",
        (abilities_ids,)
    )
    device_requirements = cur.fetchall()

    for requirement in device_requirements:
        log_str += "- " + requirement[1] + "\n"

    return log_str, device_requirements


def device_base_get(log_str, device_requirements):
    requirements_ids = []
    for requirement in device_requirements:
        requirements_ids.append(requirement[0])

    cur.execute(
        "SELECT device_base.id, device_base.name "
        "FROM device_base "
        "WHERE device_base.id = ("
        "SELECT MIN(device_requirements_and_base.base_id) "
        "FROM device_requirements_and_base "
        "WHERE device_requirements_and_base.requirement_id = ANY(%s)"
        ")",
        (requirements_ids,)
    )
    device_base = cur.fetchall()

    log_str += "\nSuch a device should be formed based on:\n"
    log_str += "- " + str(device_base[0][1]) + "\n"

    return log_str, device_base


def abstract_elements_get_based_on_base(device_base, elements_set):
    cur.execute(
        "SELECT element_id "
        "FROM  abstract_elements_and_base "
        "WHERE base_id = %s",
        (device_base,)
    )
    abstract_elements = cur.fetchall()

    for element in abstract_elements:
        elements_set.add(element[0])

    return elements_set


def abstract_elements_get_based_on_requirements(device_requirements, elements_set):
    requirements_ids = []
    for requirement in device_requirements:
        requirements_ids.append(requirement[0])

    cur.execute(
        "SELECT element_id "
        "FROM  abstract_elements_and_requirements "
        "WHERE abstract_elements_and_requirements.requirement_id = ANY(%s)",
        (requirements_ids,)
    )
    abstract_elements = cur.fetchall()

    for element in abstract_elements:
        elements_set.add(element[0])

    return elements_set


def abstract_elements_get_based_on_elements(elements_set):
    cur.execute(
        "SELECT element_2 "
        "FROM abstract_elements_and_elements "
        "WHERE element_1 = ANY(%s)",
        (list(elements_set),)
    )
    abstract_elements = cur.fetchall()

    for element in abstract_elements:
        elements_set.add(element[0])

    return elements_set


def abstract_elements_get_names(elements_set):
    cur.execute(
        "SELECT id, name "
        "FROM abstract_elements "
        "WHERE id = ANY(%s)",
        (list(elements_set),)
    )
    abstract_elements = cur.fetchall()

    return abstract_elements


def abstract_subelements_get_based_on_elements(
        log_str, abstract_elements, device_requirements,
        device_base, abstract_device_arr
):
    for element in abstract_elements:

        requirements_ids = []
        for requirement in device_requirements:
            requirements_ids.append(requirement[0])

        cur.execute(
            "SELECT id, name "
            "FROM abstract_subelements "
            "WHERE id = ANY("
            "SELECT subelement_id "
            "FROM abstract_elements_and_subelements "
            "WHERE element_id = %s "
            "AND requirement_id = ANY(%s)"
            ")",
            (element[0], requirements_ids,)
        )
        abstract_subelements = cur.fetchall()

        subelements_set = set()

        for subelement in abstract_subelements:
            subelements_set.add(subelement)

        cur.execute(
            "SELECT id, name "
            "FROM abstract_subelements "
            "WHERE id = ANY("
            "SELECT subelement_id "
            "FROM abstract_subelements_and_base "
            "WHERE element_id = %s "
            "AND base_id = %s"
            ")",
            (element[0], device_base)
        )
        abstract_subelements = cur.fetchall()

        for subelement in abstract_subelements:
            subelements_set.add(subelement)

        abstract_device_arr[element] = subelements_set

    log_str += "Abstract elements of the device:\n"

    for element in abstract_device_arr:
        log_str += "- " + str(element[1]) + "\n"
        for subelement in abstract_device_arr[element]:
            log_str += "-- " + str(subelement[1]) + "\n"

    return log_str, abstract_device_arr


def device_links_get(device_abilities):
    abilities_ids = []
    for ability in device_abilities:
        abilities_ids.append(ability[0])

    cur.execute(
        "SELECT abstract_links_and_abilities.link_id, abstract_links.name, "
        "abstract_links_and_abilities.ability_id, device_abilities.name "
        "FROM abstract_links_and_abilities, abstract_links, device_abilities "
        "WHERE abstract_links_and_abilities.link_id = abstract_links.id "
        "AND abstract_links_and_abilities.ability_id = device_abilities.id "
        "AND abstract_links_and_abilities.ability_id = ANY(%s)",
        (abilities_ids,)
    )
    device_links = cur.fetchall()

    return device_links


def types_of_communication_get(log_str, device_base):
    cur.execute(
        "SELECT id, name "
        "FROM communication_levels "
        "WHERE id = ANY("
        "SELECT type_id "
        "FROM base_and_communication "
        "WHERE base_id = %s"
        ")",
        (device_base,)
    )
    communications = cur.fetchall()

    log_str += "\nPossible types communications:\n"
    for communication in communications:
        log_str += "- " + str(communication[1]) + "\n"

    return log_str, communications


def communication_actions_get(communications):
    communication_ids = []
    for communication in communications:
        communication_ids.append(communication[0])

    cur.execute(
        "SELECT id, name, description "
        "FROM attack_actions "
        "WHERE id = ANY("
        "SELECT DISTINCT action_id "
        "FROM communication_and_actions "
        "WHERE type_id = ANY(%s)"
        ")",
        (communication_ids,)
    )
    communication_actions = cur.fetchall()

    return communication_actions


def elements_actions_get(abstract_device_arr):
    elements_ids = []
    for element in abstract_device_arr:
        elements_ids.append(element[0])

    cur.execute(
        "SELECT id, name, description "
        "FROM attack_actions "
        "WHERE id = ANY("
        "SELECT DISTINCT action_id "
        "FROM elements_and_actions "
        "WHERE type_id = ANY("
        "SELECT DISTINCT type_id "
        "FROM abstract_elements_and_types "
        "WHERE element_id = ANY(%s)"
        ")"
        ")",
        (elements_ids,)
    )
    elements_actions = cur.fetchall()

    return elements_actions


def attack_actions_union(
        log_str,
        communication_actions, elements_actions, attacker_actions
):
    device_actions_list = communication_actions + elements_actions
    device_actions_set = set(device_actions_list)

    log_str += "\nAttack actions, that are possible based on the device:\n"
    for action in device_actions_set:
        log_str += "- " + str(action[1]) + ": " + str(action[2]) + "\n"

    # Attack actions that are possible based on attacker parameters were extracted before
    log_str += "\nAttack actions, that are possible based on the model of attacker:\n"
    for action in attacker_actions:
        log_str += "- " + str(action[1]) + ": " + str(action[2]) + "\n"

    # Union of possible attack actions (based on device & based on attacker)
    possible_actions_list = list(device_actions_set & set(attacker_actions))

    if len(possible_actions_list) > 0:
        log_str += "\nPossible attack actions list:\n"
        for action in possible_actions_list:
            log_str += "- " + str(action[1]) + ": " + str(action[2]) + "\n"

    return log_str, possible_actions_list


def device_security_elements_get(log_str, possible_actions_list):
    actions_ids = []
    for action in possible_actions_list:
        actions_ids.append(action[0])

    cur.execute(
        "SELECT id, name "
        "FROM security_elements "
        "WHERE id = ANY("
        "SELECT element_id "
        "FROM security_and_actions "
        "WHERE action_id = ANY(%s)"
        ")",
        (actions_ids,)
    )
    security_elements = cur.fetchall()

    log_str += "\nPossible security elements to prevent them:\n"

    for element in security_elements:
        log_str += "- " + str(element[1]) + "\n"

    return log_str, security_elements


def abstract_elements_get_security(
        log_str, abstract_device_arr, security_elements
):
    elements_ids = []
    for element in security_elements:
        elements_ids.append(element[0])

    cur.execute(
        "SELECT id, name "
        "FROM abstract_elements "
        "WHERE id = ANY("
        "SELECT element_1 "
        "FROM abstract_elements_and_security "
        "WHERE element_2 = ANY(%s)"
        ")",
        (elements_ids,)
    )
    additional_elements = cur.fetchall()

    if len(additional_elements) > 0:
        log_str += "\nAdditional elements of the device:\n"

        for element in additional_elements:
            log_str += "- " + str(element[1]) + "\n"
            if element not in abstract_device_arr:
                abstract_device_arr[element] = set()

    return log_str, abstract_device_arr


def abstract_subelements_get_security(
        log_str, abstract_device_arr, security_elements
):
    security_ids = []
    for element in security_elements:
        security_ids.append(element[0])

    elements_ids = []
    for element in abstract_device_arr:
        elements_ids.append(element[0])

    cur.execute(
        "SELECT abstract_subelements_and_security.element_id, abstract_elements.name, "
        "abstract_subelements_and_security.subelement_id, abstract_subelements.name "
        "FROM abstract_subelements_and_security, abstract_subelements, abstract_elements "
        "WHERE security_id = ANY(%s) "
        "AND element_id = ANY(%s) "
        "AND abstract_subelements_and_security.subelement_id = abstract_subelements.id "
        "AND abstract_subelements_and_security.element_id = abstract_elements.id",
        (security_ids, elements_ids,)
    )
    additional_subelements = cur.fetchall()

    if len(additional_subelements) > 0:
        log_str += "\nAdditional subelements of the device:\n"

        additional_subelements_set = set(additional_subelements)

        for element in additional_subelements_set:
            log_str += "- " + str(element[3]) + "\n"

        for element in additional_subelements:
            temp_key = (element[0], element[1])
            temp_set = abstract_device_arr[temp_key]
            temp_set.add((element[2], element[3]))
            abstract_device_arr[temp_key] = temp_set

    return log_str, abstract_device_arr


def device_recommendations_get(log_str, security_elements):
    device_recommendations_set = set()

    if len(security_elements) > 0:
        security_ids = []
        for element in security_elements:
            security_ids.append(element[0])

        cur.execute(
            "SELECT id, name "
            "FROM device_recommendations "
            "WHERE id = ANY("
            "SELECT recommendation_id "
            "FROM device_recommendations_and_security "
            "WHERE security_id = ANY(%s)"
            ")",
            (security_ids,)
        )
        device_recommendations = cur.fetchall()
        device_recommendations_set = set(device_recommendations)

        if len(device_recommendations_set) > 0:
            log_str += "\nRecommendations for this device:\n"

            for recommendation in device_recommendations_set:
                log_str += "- " + str(recommendation[1]) + "\n"

    return log_str, device_recommendations_set


def system_recommendations_get(security_elements, system_recommendations):
    if len(security_elements) > 0:
        security_ids = []
        for element in security_elements:
            security_ids.append(element[0])

        cur.execute(
            "SELECT id, name "
            "FROM system_recommendations "
            "WHERE id = ANY("
            "SELECT recommendation_id "
            "FROM system_recommendations_and_security "
            "WHERE security_id = ANY(%s)"
            ")",
            (security_ids,)
        )
        cur_system_recommendations = cur.fetchall()
        cur_system_recommendations_set = set(cur_system_recommendations)

        prev_recommendations_set = system_recommendations["system"]
        new_recommendations_set = prev_recommendations_set.union(cur_system_recommendations_set)

        system_recommendations["system"] = new_recommendations_set

    return system_recommendations


def requirements_formation_initialization():
    global btn_index

    btn_index = 0
    devices_list = list()
    devices_requirements = {}
    devices_communications = {}
    devices_links = {}
    devices_bases = {}

    return \
        devices_list, devices_requirements, \
        devices_communications, devices_links, devices_bases


def abstract_elements_with_subelements_get(
        log_str, device_base, device_requirements
):
    elements_set = set()

    # Getting abstract elements of device based on its base
    elements_set = \
        abstract_elements_get_based_on_base(
            device_base, elements_set
        )

    # Getting abstract elements of device based on its requirements
    elements_set = \
        abstract_elements_get_based_on_requirements(
            device_requirements, elements_set
        )

    # Getting abstract elements of device based on its elements
    elements_set = \
        abstract_elements_get_based_on_elements(elements_set)

    # Getting text values of device elements for output
    abstract_elements = \
        abstract_elements_get_names(elements_set)

    # Dictionary for abstract model of device
    abstract_device_arr = {}

    # Getting sub-elements of device elements
    log_str, abstract_device_arr = \
        abstract_subelements_get_based_on_elements(
            log_str, abstract_elements, device_requirements,
            device_base, abstract_device_arr
        )

    return log_str, abstract_device_arr


def possible_actions_get(
        log_str, devices_communications,
        abstract_device_arr, attacker_actions
):
    # Getting attack actions that are possible based on types of communications
    communication_actions = \
        communication_actions_get(devices_communications)

    # Getting attack actions that are possible based on device elements
    elements_actions = \
        elements_actions_get(abstract_device_arr)

    # Union of possible attack actions
    log_str, possible_actions_list = \
        attack_actions_union(
            log_str,
            communication_actions, elements_actions, attacker_actions
        )

    return log_str, possible_actions_list


def abstract_elements_and_subelements_additional_get(
        log_str, possible_actions_list, abstract_device_arr
):
    security_elements = {}

    if len(possible_actions_list) > 0:
        # Getting list of security elements to prevent attack actions
        log_str, security_elements = \
            device_security_elements_get(log_str, possible_actions_list)

        # Getting additional abstract elements that represent security elements
        log_str, abstract_device_arr = \
            abstract_elements_get_security(
                log_str, abstract_device_arr, security_elements
            )

        # Getting additional abstract sub-elements that represent security elements
        log_str, abstract_device_arr = \
            abstract_subelements_get_security(
                log_str, abstract_device_arr, security_elements
            )

    log_str += "\nGenerated set of device components:\n"

    for element in abstract_device_arr:
        log_str += "- " + str(element[1]) + "\n"
        for subelement in abstract_device_arr[element]:
            log_str += "-- " + str(subelement[1]) + "\n"

    return log_str, abstract_device_arr, security_elements


def link_step_init():
    global select_step
    global select_dict

    select_key = "step_" + str(select_step)
    select_step += 1
    select_dict[select_key] = {}

    return select_key


def link_step_form(
        temp_links, temp_devices, link_key, select_key
):
    global select_dict

    select_dict[select_key]["key"] = link_key
    select_dict[select_key]["type"] = "link"
    select_dict[select_key]["id"] = temp_links[link_key]["id"]

    link_name = temp_links[link_key]["type"] + " communication between "
    temp_parties = temp_links[link_key]["parties"]

    for party_key in temp_parties:
        device_name = temp_devices[party_key]["name"]
        link_name += device_name + " and "

        for subparty_key in temp_parties[party_key]:
            subdevice_name = temp_devices[subparty_key]["name"]
            link_name += subdevice_name + ", "

    link_name = link_name[:-2]
    select_dict[select_key]["name"] = link_name.capitalize()
    select_dict[select_key]["label"] = "Communications"

    select_dict[select_key]["hierarchy"] = "links" + "->" + link_key
    select_dict[select_key]["dependencies"] = temp_links[link_key]["dependencies"]
    select_dict[select_key]["requirements"] = temp_links[link_key]["requirements"]
    select_dict[select_key]["selected"] = {}


def selection_steps_based_on_links():
    global select_dict
    global select_step
    global abstract_system_composition

    temp_links = abstract_system_composition["links"]
    temp_devices = abstract_system_composition["devices"]

    for link_key in temp_links:
        # Initialization of step
        select_key = link_step_init()

        # Formation of step
        link_step_form(
            temp_links, temp_devices, link_key, select_key
        )


def device_selection_init(device_key):
    global develop_dict

    device_elements = set()
    device_ids_and_keys = {}
    el_dict = {}
    develop_dict[device_key] = {}

    return device_elements, device_ids_and_keys, el_dict


def check_if_selectable(element_id):
    flag = False

    cur.execute(
        "SELECT element_id "
        "FROM selectable_elements "
        "WHERE element_id = %s",
        (element_id,)
    )
    result = cur.fetchall()

    if len(result) > 0:
        flag = True

    return flag


def device_step_init():
    global select_step
    global select_dict

    select_key = "step_" + str(select_step)
    select_step += 1
    select_dict[select_key] = {}

    return select_key


def device_step_form(
        select_key, element_key, device_key, el_dict, temp_devices
):
    global select_dict

    select_dict[select_key]["key"] = element_key
    select_dict[select_key]["type"] = "element"
    select_dict[select_key]["id"] = el_dict[element_key]["id"]
    select_dict[select_key]["name"] = el_dict[element_key]["name"].capitalize()
    select_dict[select_key]["label"] = temp_devices[device_key]["name"]
    select_dict[select_key]["hierarchy"] = "devices" + "->" + el_dict[element_key]["hierarchy"]
    select_dict[select_key]["dependencies"] = el_dict[element_key]["dependencies"]
    select_dict[select_key]["requirements"] = el_dict[element_key]["requirements"]
    select_dict[select_key]["selected"] = {}
    select_dict[select_key]["selected"]["same_for"] = {}


def device_step_req(el_dict, element_key, device_key):
    global develop_dict

    temp_requirements = el_dict[element_key]["requirements"]

    if len(temp_requirements) > 0:
        if element_key not in develop_dict[device_key]:
            develop_dict[device_key][element_key] = el_dict[element_key]


def selection_steps_based_on_devices():
    global select_step
    global select_dict
    global develop_dict
    global abstract_system_composition

    temp_devices = abstract_system_composition["devices"]

    for device_key in temp_devices:
        # Initialization
        device_elements, device_ids_and_keys, el_dict = \
            device_selection_init(device_key)

        # Getting device elements composition with all necessary data
        el_dict = \
            recursive(temp_devices[device_key], el_dict, device_key)

        for element_key in el_dict:
            element_id = el_dict[element_key]["id"]

            if element_id not in device_elements:
                device_elements.add(element_id)

                # If it is possible to select something
                if check_if_selectable(element_id):
                    # Initialization
                    select_key = device_step_init()

                    # Formation
                    device_step_form(
                        select_key, element_key, device_key, el_dict, temp_devices
                    )

                    # For prevention of selection of the same element multiple times
                    device_ids_and_keys[element_id] = select_key

                else:
                    # If element can't be selected - it can be translated into requirement to system implementation
                    device_step_req(el_dict, element_key, device_key)

            else:
                # To prevent selection of the same element multiple times
                select_key = device_ids_and_keys[element_id]
                select_dict[select_key]["selected"]["same_for"][element_key] = {}


def detailed_model_selection_steps():
    global select_dict
    global select_step

    select_dict.clear()

    # First steps are always related to links between devices
    selection_steps_based_on_links()

    # After links, steps are related to system devices, one by one
    selection_steps_based_on_devices()

    # print("Select steps:\n", select_dict, "\n")

    # Initial state
    select_step = 1


def options_init_data(temp_select_element):
    temp_dev_key = temp_select_element["hierarchy"].split("->")[1]
    temp_elem_key = temp_select_element["key"]
    temp_elem_id = temp_select_element["id"]
    temp_reqs = temp_select_element["requirements"]

    temp_deps = {}
    if temp_dev_key in select_deps:
        if temp_elem_key in select_deps[temp_dev_key]:
            temp_deps = select_deps[temp_dev_key][temp_elem_key]

    temp_options_set = set()

    return temp_elem_id, temp_reqs, temp_deps, temp_options_set


def table_name_get(temp_elem_id, select_key):
    global select_dict

    cur.execute(
        "SELECT table_name "
        "FROM selectable_elements_and_db_tables "
        "WHERE element_id = %s",
        (temp_elem_id,)
    )
    temp_table = cur.fetchall()
    temp_table_name = temp_table[0][0]

    select_dict[select_key]["selected"]["table"] = temp_table_name

    return temp_table_name


def possible_options_get(temp_table_name, temp_options_set):
    cur.execute(
        sql.SQL(
            'SELECT id FROM {}'
        ).format(sql.Identifier(temp_table_name))
    )
    temp_options = cur.fetchall()

    for temp_option in temp_options:
        temp_options_set.add(temp_option[0])

    return temp_options_set


def compatible_options_get(
        temp_reqs, temp_table_name, temp_options_set
):
    temp_compatible_set = set()
    temp_compatible_count = 0
    # print("\nCOMPATIBILITY")

    if bool(temp_reqs):
        temp_options = set()

        for temp_req in temp_reqs:

            if "requirement_" in temp_req:

                temp_id = temp_reqs[temp_req]["id"]

                if len(temp_options) > 0:
                    cur.execute(
                        sql.SQL(
                            "SELECT option_id FROM {} "
                            "WHERE requirement_id = %s "
                            "AND option_id = ANY(%s)"
                        ).format(sql.Identifier(temp_table_name + '_and_compatibility')),
                        (temp_id, list(temp_options),)
                    )

                    temp_options.clear()

                else:
                    cur.execute(
                        sql.SQL(
                            "SELECT option_id FROM {} "
                            "WHERE requirement_id = %s"
                        ).format(sql.Identifier(temp_table_name + '_and_compatibility')),
                        (temp_id,)
                    )

                temp_options_ids = cur.fetchall()

                if len(temp_options) > 0:
                    temp_options.clear()

                for option in temp_options_ids:
                    temp_options.add(option[0])

                temp_compatible_count += 1

        temp_compatible_set = temp_options

    # if len(temp_compatible_set) > 0:
    # print(temp_compatible_set)

    if temp_compatible_count > 0:
        temp_options_set.intersection_update(temp_compatible_set)

    return temp_options_set


def required_options_get(
        temp_reqs, temp_table_name, temp_options_set
):
    temp_required_set = set()
    temp_required_count = 0
    # print("\nREQUIREMENTS")

    if bool(temp_reqs):
        sql_query = "SELECT id "
        sql_query += "FROM " + temp_table_name
        sql_query += " WHERE"

        for temp_req in temp_reqs:
            if "requirement_" not in temp_req:
                sql_query += " " + temp_req + " >= " + str(temp_reqs[temp_req]) + " AND"
                temp_required_count += 1

        if temp_required_count > 0:
            sql_query = sql_query[:-4]
            cur.execute(sql_query)
            temp_options_ids = cur.fetchall()

            if len(temp_options_ids) > 0:
                for temp_option in temp_options_ids:
                    temp_required_set.add(temp_option[0])

    # if len(temp_required_set) > 0:
    #     print(temp_required_set)

    if temp_required_count > 0:
        temp_options_set.intersection_update(temp_required_set)

    return temp_options_set


def dependable_options_get(
        temp_deps, temp_table_name, temp_options_set
):
    temp_dependable_set = set()
    # print("\nDEPENDENCIES")

    if bool(temp_deps):
        temp_options = set()

        for temp_dep in temp_deps:

            for temp_id in temp_deps[temp_dep]:

                if len(temp_options) > 0:
                    cur.execute(
                        sql.SQL('SELECT option_1 FROM {} '
                                'WHERE option_2 = %s '
                                'AND option_1 = ANY(%s)'
                                ).format(sql.Identifier(temp_table_name + "_and_" + temp_dep)),
                        (temp_id, list(temp_options),)
                    )

                    temp_options.clear()
                else:
                    cur.execute(
                        sql.SQL('SELECT option_1 FROM {} '
                                'WHERE option_2 = %s'
                                ).format(sql.Identifier(temp_table_name + "_and_" + temp_dep)),
                        (temp_id,)
                    )

                temp_options_ids = cur.fetchall()

                for option in temp_options_ids:
                    temp_options.add(option[0])

            temp_dependable_set = temp_options

        temp_options_set.intersection_update(temp_dependable_set)

    # if len(temp_dependable_set) > 0:
    #     print(temp_dependable_set)

    return temp_options_set


def selection_process_options_elements(
        select_key, temp_select_element
):
    # print("SELECTING")
    # print("-", temp_select_element)

    # Getting initial data
    temp_elem_id, temp_reqs, temp_deps, temp_options_set = \
        options_init_data(temp_select_element)

    # Getting table name related to currently selected element
    temp_table_name = \
        table_name_get(temp_elem_id, select_key)

    # Getting all possible options
    temp_options_set = \
        possible_options_get(temp_table_name, temp_options_set)

    # Getting options based on compatibility requirements
    temp_options_set = \
        compatible_options_get(
            temp_reqs, temp_table_name, temp_options_set
        )

    # Getting options based on functional and non-functional requirements
    temp_options_set = \
        required_options_get(
            temp_reqs, temp_table_name, temp_options_set
        )

    # Getting options based on dependencies with already selected elements
    temp_options_set = \
        dependable_options_get(
            temp_deps, temp_table_name, temp_options_set
        )

    # print("\nOPTIONS")
    # print(temp_options_set, "\n")

    # Getting options list
    cur.execute(
        sql.SQL(
            "SELECT * FROM {} WHERE id = ANY(%s)"
        ).format(sql.Identifier(temp_table_name)),
        (list(temp_options_set),)
    )
    temp_options = cur.fetchall()
    temp_selectable_options = temp_options

    return temp_selectable_options


def selection_process_options_links(select_key, temp_select_element):
    global select_dict

    select_dict[select_key]["selected"]["table"] = "links_between_devices"
    sql_query = "SELECT * FROM links_between_devices WHERE"
    temp_reqs = temp_select_element["requirements"]

    for req_key in temp_reqs:
        req_value = temp_reqs[req_key]
        sql_query += " " + str(req_key) + " = " + str(req_value) + " AND"
    sql_query = sql_query[:-3]

    cur.execute(sql_query)
    temp_options = cur.fetchall()
    temp_selectable_options = temp_options

    return temp_selectable_options


def selection_process_options(select_key, temp_select_element):
    temp_selectable_options = []

    # Getting selectable options for links between devices
    if temp_select_element["type"] == "link":
        temp_selectable_options = \
            selection_process_options_links(
                select_key, temp_select_element
            )

    # Getting selectable options for components of devices
    if temp_select_element["type"] == "element":
        temp_selectable_options = \
            selection_process_options_elements(
                select_key, temp_select_element
            )

    return temp_selectable_options


def select_interface_label(
        curr_label, prev_label, scrollable_frame,
        element_name
):
    if curr_label != prev_label:
        label = ttk.Label(
            scrollable_frame,
            text=curr_label,
            font=('Helvetica', 10, 'bold'),
            anchor='nw'
        )
        label.pack(fill="both", padx=3)

        prev_label = curr_label

    label = ttk.Label(
        scrollable_frame,
        text=str(select_step) + ". " + element_name,
        anchor='nw'
    )
    label.pack(fill="both", padx=3)

    return scrollable_frame, prev_label, curr_label


def select_interface_combobox(
        scrollable_frame, temp_selectable_options
):
    temp_cb_options = []

    for option in temp_selectable_options:
        temp_str = str(option[0]) + " - " + str(option[1]) + " " + str(option[2]) + " " + str(option[3])
        temp_cb_options.append(temp_str)

    combobox = ttk.Combobox(
        scrollable_frame,
        values=temp_cb_options,
        width=70
    )
    combobox.pack(padx=5)
    combobox.current(0)

    return scrollable_frame, combobox


def on_confirm_values_get():
    global select_btns, select_cbs, step_index

    temp_button = select_btns[step_index - 1]
    temp_combobox = select_cbs[step_index - 1]

    value = temp_combobox.get()
    temp_id = value.split(" ")[0]

    return temp_button, temp_combobox, temp_id


def on_confirm_init(temp_id):
    global select_dict, step_index

    step_key = "step_" + str(step_index)
    # print(step_key)
    select_dict[step_key]["selected"]["db_id"] = temp_id

    temp_step = select_dict[step_key]
    # print("-", temp_step, "\n")

    temp_dependencies = temp_step["dependencies"]

    return temp_step, temp_dependencies


def on_confirm_links(temp_dependencies, temp_step):
    global select_deps

    for temp_dep in temp_dependencies:
        # Saving data about dependencies of the selected link
        # to take them into account during next selection steps
        temp_dev_key = temp_dependencies[temp_dep]["device_key"]
        if temp_dev_key not in select_deps:
            select_deps[temp_dev_key] = {}

        temp_elem_key = temp_dependencies[temp_dep]["element_key"]
        if temp_elem_key not in select_deps[temp_dev_key]:
            select_deps[temp_dev_key][temp_elem_key] = {}

        temp_table = temp_step["selected"]["table"]
        if temp_table not in select_deps[temp_dev_key][temp_elem_key]:
            select_deps[temp_dev_key][temp_elem_key][temp_table] = {}

        temp_id = temp_step["selected"]["db_id"]
        if temp_id not in select_deps[temp_dev_key][temp_elem_key][temp_table]:
            select_deps[temp_dev_key][temp_elem_key][temp_table][temp_id] = {}


def on_confirm_devices(temp_dependencies, temp_step):
    global select_deps

    for temp_elem_key in temp_dependencies:
        # Saving data about dependencies of the selected element
        # to take them into account during next selection steps
        temp_dev_key = temp_step["hierarchy"].split("->")[1]

        if temp_dev_key not in select_deps:
            select_deps[temp_dev_key] = {}

        if temp_elem_key not in select_deps[temp_dev_key]:
            select_deps[temp_dev_key][temp_elem_key] = {}

        temp_table = temp_step["selected"]["table"]
        if temp_table not in select_deps[temp_dev_key][temp_elem_key]:
            select_deps[temp_dev_key][temp_elem_key][temp_table] = {}

        temp_id = temp_step["selected"]["db_id"]
        if temp_id not in select_deps[temp_dev_key][temp_elem_key][temp_table]:
            select_deps[temp_dev_key][temp_elem_key][temp_table][temp_id] = {}


def select_process_on_confirm():
    global step_index

    # Getting selected on previous step
    temp_button, temp_combobox, temp_id = \
        on_confirm_values_get()

    # Initialization
    temp_step, temp_dependencies = \
        on_confirm_init(temp_id)

    # Separate process for links between devices
    if temp_step["type"] == "link":
        on_confirm_links(temp_dependencies, temp_step)

    # Separate process for components of devices
    if temp_step["type"] == "element":
        on_confirm_devices(temp_dependencies, temp_step)

    # Disabling combobox and button related to previous selection step
    temp_button["state"] = "disabled"
    temp_combobox["state"] = "disabled"


def first_element_to_detail(temp_dict_keys, temp_element_key, temp_element):
    # Moving through hierarchy
    for key in temp_dict_keys:
        if key != temp_element_key:
            temp_element = temp_element[key]

    temp_element = temp_element[temp_element_key]
    temp_element["selected"] = {}

    return temp_element


def add_components_to_hierarchy(temp_dict_keys, temp_element_key):
    new_temp_dict_keys = list()

    for index in range(0, len(temp_dict_keys)):
        value = temp_dict_keys[index]

        new_temp_dict_keys.append(value)
        if value != "devices" and value != temp_element_key:
            new_temp_dict_keys.append("components")

    temp_dict_keys = new_temp_dict_keys

    return temp_dict_keys


def first_element_data(temp_table, temp_db_id, temp_element):
    cur.execute(
        sql.SQL(
            "SELECT * FROM {} WHERE id = %s"
        ).format(sql.Identifier(temp_table)),
        (temp_db_id,)
    )
    temp_value = cur.fetchall()[0]
    temp_columns = [desc[0] for desc in cur.description]

    temp_index = 0
    for column in temp_columns:
        value = temp_value[temp_index]

        # Inserting parameters data
        temp_element["selected"][column] = str(value)
        temp_index += 1

    return temp_element


def detailing_process_init(step):
    global select_dict

    # Getting database table name and tuple id
    temp_type = select_dict[step]["type"]
    temp_hierarchy = select_dict[step]["hierarchy"]
    temp_table = select_dict[step]["selected"]["table"]
    temp_db_id = select_dict[step]["selected"]["db_id"]

    # Initialization
    temp_element = abstract_system_composition
    temp_dict_keys = temp_hierarchy.split("->")
    temp_element_key = temp_dict_keys[-1]

    return temp_type, temp_dict_keys, temp_element_key, \
           temp_element, temp_table, temp_db_id


def abstract_model_detailing():
    global abstract_system_composition

    temp_selected_elements = {}

    for step in select_dict:

        temp_type, temp_dict_keys, temp_element_key, \
        temp_element, temp_table, temp_db_id = \
            detailing_process_init(step)

        # Separate process for elements to add "components" part into hierarchy
        if temp_type == "element":
            temp_dict_keys = \
                add_components_to_hierarchy(
                    temp_dict_keys, temp_element_key
                )

        # Get first element to be fulfilled
        temp_element = \
            first_element_to_detail(
                temp_dict_keys, temp_element_key, temp_element
            )

        # Getting data about first element
        temp_element = \
            first_element_data(temp_table, temp_db_id, temp_element)

        # Insertion of the formed data into abstract model
        set_nested(abstract_system_composition, temp_dict_keys, temp_element)

        # Separate process for elements of the system (not links)
        # It is required for calculation of additional parameters of devices
        if temp_type == "element":
            temp_device_key = temp_dict_keys[1]

            if temp_device_key not in temp_selected_elements:
                temp_selected_elements[temp_device_key] = {}

            temp_selected_elements[temp_device_key][temp_element_key] = temp_element

    return temp_selected_elements


def device_parameters_calculation(
        output_str, device_key, temp_selected_elements
):
    global abstract_system_composition

    # For each device separately
    device_name = abstract_system_composition["devices"][device_key]["name"]
    # print(device_name.upper())

    output_str += device_name.upper() + "\n"
    output_str += "========================================"
    temp_price = 0
    temp_energy = 0
    temp_voltage = 0
    temp_current = 0
    temp_length = 0
    temp_width = 0
    temp_height = 0
    temp_flash_ec_memory = 0
    temp_flash_ws_memory = 0
    temp_sd_memory = 0
    temp_charge = 0

    # print("\nSelected components")
    output_str += "\nSelected components:\n"
    for element_key in temp_selected_elements[device_key]:
        temp_requirements = temp_selected_elements[device_key][element_key]["requirements"]

        # # Removing unnecessary parts
        # if "components" in temp_selected_elements[device_key][element_key]:
        #     del temp_selected_elements[device_key][element_key]["components"]
        #
        # if "links" in temp_selected_elements[device_key][element_key]:
        #     del temp_selected_elements[device_key][element_key]["links"]
        #
        # if "dependencies" in temp_selected_elements[device_key][element_key]:
        #     del temp_selected_elements[device_key][element_key]["dependencies"]
        #
        # if "requirements" in temp_selected_elements[device_key][element_key]:
        #     del temp_selected_elements[device_key][element_key]["requirements"]
        #
        # if "parent" in temp_selected_elements[device_key][element_key]:
        #     del temp_selected_elements[device_key][element_key]["parent"]

        # print("-", temp_selected_elements[device_key][element_key])

        temp_selected_element = temp_selected_elements[device_key][element_key]["selected"]
        temp_element_type = temp_selected_elements[device_key][element_key]["name"]
        temp_element_id = temp_selected_elements[device_key][element_key]["id"]

        if temp_element_id == 5:
            temp_charge = float(temp_selected_element["capacity_mah"])

        if "flash_kb" in temp_requirements:
            if temp_element_id == 17:
                temp_flash_ec_memory -= float(temp_requirements["flash_kb"])

            if temp_element_id == 18:
                temp_flash_ws_memory -= float(temp_requirements["flash_kb"])

        output_str += "- " + temp_element_type + " | "
        for key in temp_selected_element:
            # print("--", key, ":", temp_selected_element[key])
            if key != "id":
                output_str += key + ": " + temp_selected_element[key] + " | "

            if key == "price_rub":
                temp_price += float(temp_selected_element[key])

            if key == "energy_ma":
                temp_energy += float(temp_selected_element[key])

            if key == "voltage_v" and temp_element_id in (16, 17):
                temp_voltage = float(temp_selected_element[key])

            if key == "current_a" and temp_element_id in (16, 17):
                temp_current = float(temp_selected_element[key])

            if key == "length_mm":
                value = float(temp_selected_element[key])
                if value > temp_length:
                    temp_length = value

            if key == "width_mm":
                value = float(temp_selected_element[key])
                if value > temp_width:
                    temp_width = value

            if key == "height_mm":
                temp_height += float(temp_selected_element[key])

            if key == "flash_kb":
                if temp_element_id == 17:
                    temp_flash_ec_memory += float(temp_selected_element[key])

                if temp_element_id == 18:
                    temp_flash_ws_memory += float(temp_selected_element[key])

            if key == "memory_gb" and temp_element_id == 21:
                temp_sd_memory += float(temp_selected_element[key]) * 1024

            if key == "size_mb":
                temp_sd_memory -= float(temp_selected_element[key])

        output_str = output_str[:-3] + "\n"
    # print()

    # Software elements that should be developed because they are out of scope
    output_str += "\nTo be developed:\n"
    # print("To be developed:")
    # print("-", develop_dict[device_key])

    for element_key in develop_dict[device_key]:
        temp_element = develop_dict[device_key][element_key]
        output_str += "- " + temp_element["name"] + ": "

        temp_requirements = temp_element["requirements"]
        # print(temp_requirements)

        for requirement_key in temp_requirements:
            if "requirement_" in requirement_key:
                # print('-', requirement_key, ":", temp_requirements[requirement_key]["name"])
                output_str += temp_requirements[requirement_key]["name"] + ", "
        output_str = output_str[:-2] + "\n"
    # print()

    # Security recommendations for devices (can't be represented as system elements)
    device_recommendations = abstract_system_composition["devices"][device_key]["recommendations"]

    if len(device_recommendations) > 0:
        # print("After implementation it is recommended:")
        output_str += "\nAfter implementation it is recommended:\n"

        for recommendation_key in device_recommendations:
            # print("-", device_recommendations[recommendation_key]["name"])
            output_str += "- " + device_recommendations[recommendation_key]["name"] + "\n"
        # print()

    temp_parameters = \
        {"price_rub": temp_price, "energy_mAh": temp_energy,
         "voltage_V": temp_voltage, "current_A": temp_current,
         "length_mm": temp_length, "width_mm": temp_width, "height_mm": temp_height}

    output_str += "\n" + "Price: " + str(temp_price) + " rub | " \
                  + "Energy consumption: " + str(temp_energy) + " mAh | " \
                  + "Voltage: " + str(temp_voltage) + " V | " \
                  + "Current: " + str(temp_current) + " A | " \
                  + "Size: " + str(temp_length) + "x" + str(temp_width) + "x" + str(temp_height) + " mm | "

    if temp_flash_ec_memory > 0:
        temp_parameters["free_memory_KB"] = temp_flash_ec_memory
        output_str += "MCEC FM: " + str(temp_flash_ec_memory) + " KB | "

    if temp_flash_ws_memory > 0:
        temp_parameters["free_memory_KB"] = temp_flash_ws_memory
        output_str += "MCWS FM: " + str(temp_flash_ws_memory) + " KB | "

    if temp_sd_memory > 0:
        temp_parameters["free_memory_MB"] = temp_sd_memory
        output_str += "MCSD FM: " + str(temp_sd_memory) + " MB | "

    temp_charge /= temp_energy
    temp_charge = round(temp_charge, 2)
    output_str += "Charge: " + str(temp_charge) + " hours | "
    temp_parameters["charge_h"] = temp_charge

    output_str = output_str[:-2]
    output_str += "\n========================================\n"

    # Insertion of device parameters into system model
    abstract_system_composition["devices"][device_key]["parameters"] = temp_parameters

    return output_str


class DesignApp:

    def __init__(self):
        # 1: Create a builder
        self.dev_buttons = []
        self.builder = builder = pygubu.Builder()

        # 2: Load an ui file
        builder.add_from_file("application.ui")

        # 3: Create the window
        self.window = builder.get_object("frame1")

        # Attacker access type combobox
        self.box1 = self.builder.get_object("combobox1")
        self.box1.current(3)

        # Attacker knowledge type combobox
        self.box2 = self.builder.get_object("combobox2")
        self.box2.current(1)

        # Attacker resources type combobox
        self.box3 = self.builder.get_object("combobox3")
        self.box3.current(1)

        # First task of the designed system
        self.box4 = self.builder.get_object("combobox4")
        self.box4.current(0)

        # Second task of the designed system
        self.box5 = self.builder.get_object("combobox5")
        self.box5.current(0)

        # Third task of the designed system
        self.box6 = self.builder.get_object("combobox6")
        self.box6.current(0)

        # Log of the system design process
        self.log = self.builder.get_object("text1")
        # Scrollbar for this log
        self.scroll1 = self.builder.get_object("scrollbar1")

        # Establishing a relationship between a text field and a scroll bar
        self.log["yscrollcommand"] = self.scroll1.set
        self.scroll1["command"] = self.log.yview

        # Design button
        self.button1 = self.builder.get_object("button1")

        # Button that enables the process of selection of components of the system
        self.button3 = self.builder.get_object("button3")
        # It is disabled by default
        self.button3["state"] = "disabled"

        # Canvas for the frame that will show alternatives of components to be selected
        self.canvas = self.builder.get_object("canvas1")
        # Scrollbar for this canvas
        self.scroll2 = self.builder.get_object("scrollbar2")

        # Log of the output of the system design process
        self.output = self.builder.get_object("text2")
        # Scrollbar for this output
        self.scroll3 = self.builder.get_object("scrollbar3")

        # Establishing a relationship between a text field and a scroll bar
        self.output["yscrollcommand"] = self.scroll3.set
        self.scroll3["command"] = self.output.yview

        # Check button for enabling or disabling of the automatic system design process
        self.checkbutton = self.builder.get_object("checkbutton1")
        # By default this button is in enabled state
        self.checkbutton.select()
        # Every time this button is enabled or disabled - event is raised
        self.chbtn1_callback()

        # Activates all callback functions of all GUI elements
        builder.connect_callbacks(self)

    def run(self):
        self.window.mainloop()

    # automatic check button
    def chbtn1_callback(self):
        global automatic_mode_flag
        value = self.builder.tkvariables["chbtn_1"].get()

        if value == "1":
            automatic_mode_flag = True

        if value == "0":
            automatic_mode_flag = False

    # log buttons (devices, abstract and selected)
    def btn_callback(self, dev_str):
        self.log.delete(1.0, tk.END)
        self.log.insert("end", log_array[dev_str])

    def abstract_model_output(self):
        global btn_index

        # Formation of "Abstract" log button -> start
        btn_str = "Abstract"
        dev_str = "abstract"
        select_button = ttk.Button(
            self.window,
            text=btn_str,
            command=lambda d_str=dev_str: self.btn_callback(dev_str),
            default="normal"
        )
        select_button.place(x=90 + 69 * btn_index, y=187, width=70)
        btn_index += 1
        # Formation of "Abstract" log button -> end

        # Formation of abstract system model output -> start
        composition_json = json.dumps(
            abstract_system_composition,
            indent=2,
            separators=(",", ": ")
        )
        log_array["abstract"] = composition_json
        # Formation of abstract system model output -> end

    def design_abstract_model(
            self,
            system_recommendations,
            abstract_system_arr,
            abstract_links_arr,
            system_security_elements_set
    ):
        global abstract_system_composition
        # 1
        abstract_model_initialization()
        # 2
        abstract_model_system_recommendations(system_recommendations)
        # 3
        device_keys, devices_elements_keys = \
            abstract_model_devices(system_recommendations, abstract_system_arr)
        # 4
        links_dep_elements = \
            abstract_model_links(device_keys, devices_elements_keys, abstract_links_arr)
        # 5
        abstract_model_links_requirements(links_dep_elements, system_security_elements_set)
        # 6
        abstract_model_devices_dependencies_and_requirements()
        # print("Before hierarchy:\n", abstract_system_composition)
        # 7
        abstract_model_devices_hierarchy()
        # print("\nAfter hierarchy:\n", abstract_system_composition, "\n")

        self.abstract_model_output()

    def design_initialization(self):
        global select_step, select_dict, select_deps, \
            select_btns, select_cbs
        global log_array, log_buttons_array
        global abstract_system_composition
        global step_index

        select_step = 1
        step_index = 0
        select_dict.clear()
        select_deps.clear()

        log_array.clear()
        self.log.delete(1.0, tk.END)
        self.output.delete(1.0, tk.END)

        abstract_system_composition.clear()

        self.button3["state"] = "disabled"
        self.canvas.delete("all")
        self.canvas.yview_moveto(0)

        select_btns.clear()
        select_cbs.clear()

        for temp_button in log_buttons_array:
            temp_button.destroy()

        log_buttons_array.clear()

        abstract_system_arr = {}
        abstract_links_arr = {}
        system_recommendations = {"system": set()}
        system_security_elements_set = set()

        log_str = ''

        return \
            log_str, abstract_system_arr, abstract_links_arr, \
            system_recommendations, system_security_elements_set

    def attacker_parameters_get(self):
        access_type = self.builder.tkvariables["cb_1"].get()[0]
        knowledge_type = self.builder.tkvariables["cb_2"].get()[0]
        resources_type = self.builder.tkvariables["cb_3"].get()[0]

        return access_type, knowledge_type, resources_type

    def system_tasks_get(self):
        task_1 = self.builder.tkvariables["cb_4"].get()[0]
        task_2 = self.builder.tkvariables["cb_5"].get()[0]
        task_3 = self.builder.tkvariables["cb_6"].get()[0]

        return task_1, task_2, task_3

    def create_devices_log_buttons(self, requirement):
        global btn_index
        global log_buttons_array

        req_str = requirement.removeprefix("device that represents ").removesuffix(" of the system")
        words_list = req_str.split()
        dev_str = words_list[-1]
        btn_str = dev_str.capitalize()

        button = ttk.Button(
            self.window,
            text=btn_str,
            command=lambda d_str=dev_str: self.btn_callback(dev_str),
            default="normal"
        )
        button.place(x=90 + 69 * btn_index, y=187, width=70)

        log_buttons_array.append(button)
        btn_index += 1

        return req_str, btn_str, dev_str

    def input_data_get(self):
        # Getting parameters of the attacker
        access_type, knowledge_type, resources_type = \
            self.attacker_parameters_get()

        # Getting tasks required from the system to be designed
        task_1, task_2, task_3 = self.system_tasks_get()

        return \
            access_type, knowledge_type, resources_type, \
            task_1, task_2, task_3

    def requirements_formation(
            self, log_str, system_security_elements_set
    ):
        global btn_index

        devices_list, devices_requirements, devices_communications, \
        devices_links, devices_bases = requirements_formation_initialization()

        access_type, knowledge_type, resources_type, \
        task_1, task_2, task_3 = \
            self.input_data_get()

        log_str, attacker_actions = \
            attacker_actions_get(log_str, access_type, knowledge_type, resources_type)

        # Getting security elements to prevent attack actions
        log_str, system_security_elements_set = \
            system_security_elements_get(
                log_str, attacker_actions, system_security_elements_set
            )

        # Getting abilities that are connected with system tasks
        log_str, system_abilities = \
            system_abilities_get(log_str, task_1, task_2, task_3)

        # Getting requirements that are connected with system abilities
        log_str, system_requirements = \
            system_requirements_get(log_str, system_abilities)

        # Saving system log
        log_array['system'] = log_str
        # Posting system log in text window
        self.log.insert('end', log_array['system'])
        log_str = ''

        for requirement in system_requirements:
            # Creating log button for the device based on system requirements
            req_str, btn_str, dev_str = \
                self.create_devices_log_buttons(requirement[1])

            # Adding device to the list
            devices_list.append(dev_str)

            # Getting tasks required from the device to be designed
            log_str, device_tasks = \
                device_tasks_get(log_str, req_str, requirement[0])

            # Getting abilities that are connected with device tasks
            log_str, device_abilities = \
                device_abilities_get(log_str, requirement[0])

            # Getting requirements that are connected with device abilities
            log_str, device_requirements = \
                device_requirements_get(log_str, device_abilities)

            devices_requirements[dev_str] = device_requirements

            # Getting device base in accordance with device requirements
            log_str, device_base = \
                device_base_get(log_str, device_requirements)

            devices_bases[dev_str] = device_base

            # Getting types of communications that are possible for device
            log_str, communications = \
                types_of_communication_get(log_str, device_base[0][0])

            devices_communications[dev_str] = communications

            # Getting links that are possible for device
            links = \
                device_links_get(device_abilities)

            devices_links[dev_str] = links

        return \
            log_str, attacker_actions, devices_list, \
            devices_requirements, devices_communications, \
            devices_links, devices_bases

    def secure_system_components_get(
            self, log_str, devices_list,
            devices_bases, devices_requirements, devices_links,
            devices_communications, attacker_actions,
            abstract_system_arr, abstract_links_arr,
            system_recommendations
    ):
        for device in devices_list:
            # Getting abstract elements of device with their sub-elements
            log_str, abstract_device_arr = \
                abstract_elements_with_subelements_get(
                    log_str, devices_bases[device][0][0], devices_requirements[device]
                )

            # Getting attack actions that are possible for device
            log_str, possible_actions_list = \
                possible_actions_get(
                    log_str, devices_communications[device],
                    abstract_device_arr, attacker_actions
                )

            # Getting additional abstract elements and sub-elements based on security ones
            log_str, abstract_device_arr, security_elements = \
                abstract_elements_and_subelements_additional_get(
                    log_str, possible_actions_list, abstract_device_arr
                )

            # Getting recommendations for device implementation based on security elements
            log_str, device_recommendations_set = \
                device_recommendations_get(log_str, security_elements)

            # Saving data about device
            abstract_system_arr[device] = abstract_device_arr
            abstract_links_arr[device] = devices_links[device]
            system_recommendations[device] = device_recommendations_set

            # Getting recommendations for system implementation based on security elements
            system_recommendations = \
                system_recommendations_get(security_elements, system_recommendations)

            # Saving log for device design process
            log_str = log_str[:-1]
            log_array[device] = log_str
            # Initial state
            log_str = ""

        # Output of system recommendations -> start
        log_str += log_array["system"] + "\nRecommendations for this system:\n"

        for recommendation in system_recommendations["system"]:
            log_str += "- " + str(recommendation[1]) + "\n"
        log_str = log_str[:-1]

        log_array["system"] = log_str
        self.log.insert("end", log_array["system"])
        # Output of system recommendations -> end

        return log_str, system_recommendations, abstract_system_arr, abstract_links_arr

    # "Design" button
    def button1_callback(self):
        global abstract_system_composition

        # Initialization
        log_str, abstract_system_arr, abstract_links_arr, \
        system_recommendations, system_security_elements_set = \
            self.design_initialization()

        # Algorithm 1
        log_str, attacker_actions, devices_list, \
        devices_requirements, devices_communications, \
        devices_links, devices_bases = \
            self.requirements_formation(
                log_str, system_security_elements_set
            )

        # Algorithm 2
        log_str, system_recommendations, abstract_system_arr, abstract_links_arr = \
            self.secure_system_components_get(
                log_str, devices_list,
                devices_bases, devices_requirements, devices_links,
                devices_communications, attacker_actions,
                abstract_system_arr, abstract_links_arr,
                system_recommendations
            )

        # Algorithm 3

        self.design_abstract_model(
            system_recommendations,
            abstract_system_arr,
            abstract_links_arr,
            system_security_elements_set
        )

        # Activation of "Select" button
        self.button3["state"] = "normal"
        # Auto-click of "Select" button if auto-mode is activated
        if automatic_mode_flag:
            self.button3.invoke()

    # log button "System"
    def button2_callback(self):
        self.log.delete(1.0, tk.END)
        self.log.insert("end", log_array["system"])

    # Algorithm for generation of alternative of system
    # after selection of the system elements
    def alternative_generation(self):
        global select_dict
        global abstract_system_composition
        global btn_index
        global log_buttons_array

        # Extraction of data about selected links and elements step by step
        temp_selected_elements = abstract_model_detailing()

        # Calculation of parameters of devices based on parameters of their components
        # Also formation of output of design process
        output_str = ""
        for device_key in temp_selected_elements:
            output_str = \
                device_parameters_calculation(output_str, device_key, temp_selected_elements)

        # Security recommendations for system (can't be translated into system elements)
        # This recommendations are related to all devices
        temp_recommendations = abstract_system_composition["recommendations"]
        # print("After system implementation it is recommended:")
        output_str += "After system implementation it is recommended:"

        for recommendation_key in temp_recommendations:
            # print("-", temp_recommendations[recommendation_key]["name"])
            output_str += "\n- " + temp_recommendations[recommendation_key]["name"]

        self.output.insert("end", output_str)

        # print("\nAfter selection:\n", abstract_system_composition, "\n")

        # Creation of new log button
        btn_str = "Detailed"
        dev_str = "detailed"
        select_button = ttk.Button(
            self.window,
            text=btn_str,
            command=lambda d_str=dev_str: self.btn_callback(dev_str),
            default="normal"
        )

        select_button.place(x=90 + 69 * btn_index, y=187, width=70)
        log_buttons_array.append(select_button)
        btn_index += 1

        # Output of new system model
        composition_json = json.dumps(
            abstract_system_composition,
            indent=2,
            separators=(",", ": ")
        )
        log_array["detailed"] = composition_json

    def selection_process_end(self, scrollable_frame):
        # global step_index
        # print("Selection is DONE\n")

        label = ttk.Label(
            scrollable_frame,
            text="DONE",
            font=('Helvetica', 10, 'bold'),
            anchor='nw'
        )
        label.pack(fill="both", padx=3)

        self.canvas.update_idletasks()
        self.canvas.yview_moveto(1)

        # step_index = 0
        # # self.button3["state"] = "normal"
        # self.button1.invoke()

    def select_interface_button(
            self, scrollable_frame, prev_label
    ):
        global step_index

        button = ttk.Button(
            scrollable_frame,
            text="Confirm",
            command=lambda s_frame=scrollable_frame:
            self.select_button_callback(scrollable_frame, prev_label),
            default="normal"
        )
        button.pack(pady=5)

        return scrollable_frame, button

    def select_interface_next(
            self, button, combobox, options_count
    ):
        global select_btns, select_cbs
        global select_step, step_index

        select_btns.append(button)
        select_cbs.append(combobox)
        step_index += 1
        select_step += 1

        self.canvas.update_idletasks()
        self.canvas.yview_moveto(1)

        if automatic_mode_flag:
            button.invoke()

        elif options_count <= 1:
            button.invoke()

    def select_interface(
            self, prev_label, scrollable_frame,
            temp_select_element, temp_selectable_options,
    ):
        global select_step, step_index
        global select_cbs, select_btns

        curr_label = temp_select_element["label"].upper()

        # Label
        scrollable_frame, prev_label, curr_label = \
            select_interface_label(
                curr_label, prev_label, scrollable_frame,
                temp_select_element["name"]
            )

        # Combobox
        scrollable_frame, combobox = \
            select_interface_combobox(
                scrollable_frame, temp_selectable_options
            )

        # Button
        scrollable_frame, button = \
            self.select_interface_button(
                scrollable_frame, prev_label
            )

        # Next step
        self.select_interface_next(
            button, combobox, len(temp_selectable_options)
        )

    # Step by step process of selection of system elements
    def select_button_callback(self, scrollable_frame, prev_label):
        global select_step, step_index
        global select_btns, select_cbs
        global select_deps, select_dict
        global automatic_mode_flag

        # Reaction on "Confirm" button click during selection process
        if step_index > 0:
            select_process_on_confirm()

        # Initialization
        select_key = "step_" + str(select_step)

        # Formation of select options
        if select_key in select_dict:

            temp_select_element = select_dict[select_key]

            temp_selectable_options = \
                selection_process_options(
                    select_key, temp_select_element
                )

            self.select_interface(
                prev_label, scrollable_frame,
                temp_select_element, temp_selectable_options
            )

        else:
            # Finalization of the selection process
            self.selection_process_end(scrollable_frame)

            # Generation of the alternative of the system model
            # based on the results of selection process
            self.alternative_generation()

    def selection_initialization(self):
        self.button3["state"] = "disabled"

        self.scroll2.configure(command=self.canvas.yview)
        scrollable_frame = ttk.Frame(self.canvas)

        scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(
                scrollregion=self.canvas.bbox("all")
            )
        )

        self.canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        self.canvas.configure(yscrollcommand=self.scroll2.set)

        return scrollable_frame

    # Algorithm 4
    # Initialization of selection process after "Select" button click
    def button3_callback(self):
        global select_step
        global develop_dict

        scrollable_frame = \
            self.selection_initialization()

        # Formation of the selection dictionary:
        # step by step representation of the selection process
        detailed_model_selection_steps()

        # Starting select process step by step
        self.select_button_callback(scrollable_frame, "")


if __name__ == "__main__":
    root = tk.Tk()
    root.title("Design application")
    root.resizable(False, False)
    app = DesignApp()
    app.run()

# Make the changes to the database persistent
conn.commit()
# Close communication with the database
cur.close()
conn.close()
