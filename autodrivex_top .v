module autodrivex_top(

    input obstacle_detected,
    input [7:0] distance,

    input lane_left,
    input lane_right,

    input [7:0] speed,
    input [7:0] speed_limit,

    output move_forward,
    output apply_brake,
    output turn_left_motor,
    output turn_right_motor,
    output emergency_stop_motor

);

// Internal wires
wire collision_risk;

wire turn_left_req;
wire turn_right_req;

wire accelerate_req;
wire brake_req;

wire [2:0] vehicle_status;

wire forward;
wire brake;
wire turn_left;
wire turn_right;
wire emergency_stop;


// Obstacle Detector
obstacle_detector u1(
    .obstacle_detected(obstacle_detected),
    .distance(distance),
    .collision_risk(collision_risk)
);


// Lane Detector
lane_detector u2(
    .lane_left(lane_left),
    .lane_right(lane_right),
    .turn_left(turn_left_req),
    .turn_right(turn_right_req)
);


// Speed Controller
speed_controller u3(
    .speed(speed),
    .speed_limit(speed_limit),
    .accelerate(accelerate_req),
    .brake(brake_req)
);


// Sensor Fusion
sensor_fusion_engine u4(
    .collision_risk(collision_risk),
    .turn_left_req(turn_left_req),
    .turn_right_req(turn_right_req),
    .accelerate_req(accelerate_req),
    .brake_req(brake_req),
    .vehicle_status(vehicle_status)
);


// Decision Unit
decision_unit u5(
    .vehicle_status(vehicle_status),
    .forward(forward),
    .brake(brake),
    .turn_left(turn_left),
    .turn_right(turn_right),
    .emergency_stop(emergency_stop)
);


// Motor Controller
motor_controller u6(
    .forward_in(forward),
    .brake_in(brake),
    .left_in(turn_left),
    .right_in(turn_right),
    .emergency_in(emergency_stop),

    .move_forward(move_forward),
    .apply_brake(apply_brake),
    .turn_left_motor(turn_left_motor),
    .turn_right_motor(turn_right_motor),
    .emergency_stop_motor(emergency_stop_motor)
);

endmodule