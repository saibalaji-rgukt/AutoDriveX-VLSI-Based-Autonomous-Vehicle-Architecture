`timescale 1ns/1ps

module autodrivex_tb;

//------------------------------------------------------
// Inputs
//------------------------------------------------------
reg obstacle_detected;
reg [7:0] distance;

reg lane_left;
reg lane_right;

reg [7:0] speed;
reg [7:0] speed_limit;

//------------------------------------------------------
// Outputs
//------------------------------------------------------
wire move_forward;
wire apply_brake;
wire turn_left_motor;
wire turn_right_motor;
wire emergency_stop_motor;

//------------------------------------------------------
// DUT
//------------------------------------------------------
autodrivex_top DUT (

    .obstacle_detected(obstacle_detected),
    .distance(distance),

    .lane_left(lane_left),
    .lane_right(lane_right),

    .speed(speed),
    .speed_limit(speed_limit),

    .move_forward(move_forward),
    .apply_brake(apply_brake),
    .turn_left_motor(turn_left_motor),
    .turn_right_motor(turn_right_motor),
    .emergency_stop_motor(emergency_stop_motor)

);

//------------------------------------------------------
// Monitor
//------------------------------------------------------
initial begin

    $monitor(
    "TIME=%0t | Obs=%b Dist=%d Left=%b Right=%b Speed=%d Limit=%d | F=%b B=%b TL=%b TR=%b ESTOP=%b",

    $time,

    obstacle_detected,
    distance,

    lane_left,
    lane_right,

    speed,
    speed_limit,

    move_forward,
    apply_brake,
    turn_left_motor,
    turn_right_motor,
    emergency_stop_motor
    );

end

//------------------------------------------------------
// Test Scenarios
//------------------------------------------------------
initial begin

//------------------------------------------------------
// Initialize
//------------------------------------------------------

obstacle_detected = 0;
distance = 8'd100;

lane_left = 0;
lane_right = 0;

speed = 8'd40;
speed_limit = 8'd60;

#20;

$display("\n========== Scenario 1 : Normal Driving ==========");

#40;

//------------------------------------------------------
// Left Drift
//------------------------------------------------------

$display("\n========== Scenario 2 : Left Drift ==========");

lane_left = 1;

#40;

lane_left = 0;

#20;

//------------------------------------------------------
// Right Drift
//------------------------------------------------------

$display("\n========== Scenario 3 : Right Drift ==========");

lane_right = 1;

#40;

lane_right = 0;

#20;

//------------------------------------------------------
// Obstacle Detected
//------------------------------------------------------

$display("\n========== Scenario 4 : Obstacle Ahead ==========");

obstacle_detected = 1;
distance = 8'd50;

#40;

//------------------------------------------------------
// Collision Risk
//------------------------------------------------------

$display("\n========== Scenario 5 : Collision Risk ==========");

distance = 8'd10;

#40;

//------------------------------------------------------
// Clear Road
//------------------------------------------------------

$display("\n========== Scenario 6 : Clear Road ==========");

obstacle_detected = 0;
distance = 8'd100;

#40;

//------------------------------------------------------
// Overspeed
//------------------------------------------------------

$display("\n========== Scenario 7 : Overspeed ==========");

speed = 8'd80;
speed_limit = 8'd60;

#40;

//------------------------------------------------------
// Safe Speed
//------------------------------------------------------

$display("\n========== Scenario 8 : Safe Speed ==========");

speed = 8'd55;

#40;

//------------------------------------------------------
// Simultaneous Lane Drift + Overspeed
//------------------------------------------------------

$display("\n========== Scenario 9 : Overspeed + Left Drift ==========");

speed = 8'd90;
lane_left = 1;

#40;

lane_left = 0;

#20;

//------------------------------------------------------
// Obstacle + Overspeed
//------------------------------------------------------

$display("\n========== Scenario 10 : Emergency ==========");

obstacle_detected = 1;
distance = 8'd5;

#40;

//------------------------------------------------------
// Return to Normal
//------------------------------------------------------

$display("\n========== Scenario 11 : Back to Normal ==========");

obstacle_detected = 0;
distance = 8'd100;

speed = 8'd40;

lane_left = 0;
lane_right = 0;

#100;

$display("\n========== SIMULATION COMPLETED ==========");

$finish;

end

endmodule