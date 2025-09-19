module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah 
); 
    parameter [1:0] so = 2'b00,
                    s1 = 2'b01,
                    s2 = 2'b10,
                    s3 = 2'b11;

    reg [1:0] state, next;

    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= so;
        else
            state <= next;
    end

    always @(*) begin
        case(state)
            so: next = (ground == 0) ? s2 : ((bump_left == 1) ? s1 : so);
            s1: next = (ground == 0) ? s3 : ((bump_right == 1) ? so : s1);
            s2: next = (ground == 1) ? so : s2;
            s3: next = (ground == 1) ? s1 : s3;
        endcase
    end

    assign walk_left = (state == so);
    assign walk_right = (state == s1);
    assign aaah = (state == s2) || (state == s3);
endmodule



