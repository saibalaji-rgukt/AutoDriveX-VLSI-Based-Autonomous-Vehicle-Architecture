module sensor_fusion_engine(

    input collision_risk,
    input turn_left_req,
    input turn_right_req,
    input accelerate_req,
    input brake_req,

    output [2:0] vehicle_status

);

// Priority
// Collision -> Brake -> Turn Left -> Turn Right -> Normal

assign vehicle_status =
        collision_risk ? 3'b100 :
        brake_req      ? 3'b001 :
        turn_left_req  ? 3'b011 :
        turn_right_req ? 3'b010 :
                         3'b000;

endmodule