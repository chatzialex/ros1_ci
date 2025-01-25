from tortoisebot_waypoints.msg import WaypointActionAction, WaypointActionGoal, WaypointActionResult
import rospy
import actionlib

class TortoisebotActionClient():
    action_server_name = 'tortoisebot_as'


    def __init__(self):
        self.action_client = actionlib.SimpleActionClient(self.action_server_name, WaypointActionAction)
        self.action_result = WaypointActionResult()

    def send_goal(self,goal : WaypointActionGoal):
        rospy.loginfo(f"Waiting for {self.action_server_name} action server...")
        self.action_client.wait_for_server()
        self.action_client.wait_for_server()


        rospy.loginfo(f"Sending goal x={goal.position.x} y={goal.position.y}.")
        self.action_client.send_goal(goal)
        
        self.action_client.wait_for_result()
        rospy.loginfo("Got result.")
        self.action_result = self.action_client.get_result()
