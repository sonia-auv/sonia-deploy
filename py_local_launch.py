
import subprocess
from time import sleep
import os
import argparse
from typing import List, Optional, Union

class Core:
    
    def __init__(self) -> None:
        self.process = subprocess.Popen("roscore")
        LaunchControl.add_node(self)
    
    def __del__(self):
        self.process.terminate()
        self.process.wait()

class Launch:
    
    def __init__(self, pkg, node) -> None:
        self.process = subprocess.Popen(["roslaunch", pkg, f"{node}.launch"])
        LaunchControl.add_node(self)
    
    def __del__(self):
        self.process.terminate()
        self.process.wait()

class LaunchControl:
    __instance: Optional['LaunchControl'] = None
    __launchedNodes: List[Union[Launch, Core]] = []

    def __new__(cls, *args, **kwargs) -> 'LaunchControl':
        if cls.__instance is None:
            cls.__instance = super().__new__(cls, *args, **kwargs)
        return cls.__instance
    
    @classmethod
    def add_node(cls, node):
        cls.__launchedNodes.append(node)

def main(auv):
    
    # local env setuo
    os.environ["AUV"] = "LOCAL"
    os.environ["LOCAL_AUV"] = auv
    
    # Start Core
    Core()
    
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
    parser.add_argument("-a", "--auv", type=str, default="AUV8", help="Which Local AUV to use. Defaults to AUV8")
    args = parser.parse_args()
    main(args.auv)
