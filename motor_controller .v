module motor_controller(
    input forward_in,
    input brake_in,
    input left_in,
    input right_in,
    input emergency_in,

    output move_forward,
    output apply_brake,
    output turn_left_motor,
    output turn_right_motor,
    output emergency_stop_motor
);

assign move_forward         = forward_in;
assign apply_brake          = brake_in;
assign turn_left_motor      = left_in;
assign turn_right_motor     = right_in;
assign emergency_stop_motor = emergency_in;

endmodule