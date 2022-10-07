pragma circom 2.0.0;

template IsZero(){
    signal input in;
    signal output out;
    signal inv; // Intermediate signal: express that is the inverse of the input signal
 
        //(condition) ? it's true : it's false
    inv <-- in != 0 ? 1/in : 0; // operator "<--" allow an assignation 
                                //(computational level, defining how to compute a signal)
                                //inv is equal to zero or 1/in.

    out <== -in * inv + 1; // operator "<=="" allow a signal assigment and constraint generation, 
                           //this generates:
                           // -in * (inv + 1) = out (assign this value to the output)
                           // -in * (inv + 1) - out = 0 (constraint)
    

    in * out === 0; //constraint generation to guaranteee that both signals are equal,
                    // ig the signals are not equal, constraint fails 
                    // this generates: 
                    // in * out - 0 = 0

    inv * out === 0; //constraint generation to guaranteee that all signals (in, inv, out) are equal,
                     // inv * out - 0 = 0
}

component main = IsZero();