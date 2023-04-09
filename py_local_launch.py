"""
Launch Local Nodes for simulation.
"""
import subprocess
from time import sleep
import os
import argparse
from typing import List, Optional
# pylint: disable=too-few-public-methods, consider-using-with

class BadLaunchException(Exception):
    """
    Bad Launch Exception.
    """
    def __init__(self) -> None:
        super().__init__("Package or Node not defined")

class Launch:
    """
    Class Object that Launches Roslaunch Nodes.
    """
    def __init__(self, pkg=None, node=None, is_core=False) -> None:
        if is_core:
            self.process = subprocess.Popen("roscore")
        elif pkg is not None and node is not None:
            self.process = subprocess.Popen(["roslaunch", pkg, f"{node}.launch"])
        else:
            raise BadLaunchException()

        LaunchControl.add_node(self)

    def __del__(self):
        self.process.terminate()
        self.process.wait()

class LaunchControl:
    """
    Class Object that contains Launched Nodes.
    """
    __instance: Optional['LaunchControl'] = None
    __launchedNodes: List[Launch] = []

    def __new__(cls, *args, **kwargs) -> 'LaunchControl':
        if cls.__instance is None:
            cls.__instance = super().__new__(cls, *args, **kwargs)
        return cls.__instance

    @classmethod
    def add_node(cls, node: Launch):
        """
        Add node to list to keep alive.

        Args:
            node (Union[Launch, Core]): Node to store.
        """
        cls.__launchedNodes.append(node)

def main(auv: str):
    """
    Main script to launch local nodes.

    Args:
        auv (str): AUV to launch.
    """

    # local env setuo
    os.environ["AUV"] = "LOCAL"
    os.environ["LOCAL_AUV"] = auv

    # Start Core
    Launch(is_core=True)

    sleep(1)

    # Launch Nodes
    Launch("proc_control", "proc_control")
    Launch("proc_planner", "proc_planner")
    Launch("proc_image_processing", "proc_image_processing")
    Launch("proc_mapping", "proc_mapping")
    Launch("ros_tcp_endpoint", "endpoint")

    sleep(1.5)

    print()

    while input("press enter to kill...") != '':
        ...

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-a", "--auv",
                        type=str,
                        default="AUV8",
                        help="Which Local AUV to use. Defaults to AUV8")
    parsed_args = parser.parse_args()
    main(parsed_args.auv)
