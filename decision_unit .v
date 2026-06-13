module decision_unit(

    input [2:0] vehicle_status,

    output reg forward,
    output reg brake,
    output reg turn_left,
    output reg turn_right,
    output reg emergency_stop

);

always @(*) begin

    // Default outputs
    forward        = 1'b0;
    brake          = 1'b0;
    turn_left      = 1'b0;
    turn_right     = 1'b0;
    emergency_stop = 1'b0;

    case (vehicle_status)

        // Normal Driving
        3'b000: begin
            forward = 1'b1;
        end

        // Overspeed -> Brake
        3'b001: begin
            brake = 1'b1;
        end

        // Turn Right while moving
        3'b010: begin
            forward   = 1'b1;
            turn_right = 1'b1;
        end

        // Turn Left while moving
        3'b011: begin
            forward  = 1'b1;
            turn_left = 1'b1;
        end

        // Emergency Stop
        3'b100: begin
            emergency_stop = 1'b1;
        end

        // Default
        default: begin
            forward = 1'b1;
        end

    endcase

end

endmodule