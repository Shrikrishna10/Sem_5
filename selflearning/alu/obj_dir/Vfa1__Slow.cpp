// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vfa1.h for the primary calling header

#include "Vfa1.h"
#include "Vfa1__Syms.h"

//==========

VL_CTOR_IMP(Vfa1) {
    Vfa1__Syms* __restrict vlSymsp = __VlSymsp = new Vfa1__Syms(this, name());
    Vfa1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vfa1::__Vconfigure(Vfa1__Syms* vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
    if (false && this->__VlSymsp) {}  // Prevent unused
    Verilated::timeunit(-12);
    Verilated::timeprecision(-12);
}

Vfa1::~Vfa1() {
    VL_DO_CLEAR(delete __VlSymsp, __VlSymsp = NULL);
}

void Vfa1::_eval_initial(Vfa1__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vfa1::_eval_initial\n"); );
    Vfa1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vfa1::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vfa1::final\n"); );
    // Variables
    Vfa1__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vfa1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vfa1::_eval_settle(Vfa1__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vfa1::_eval_settle\n"); );
    Vfa1* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vfa1::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vfa1::_ctor_var_reset\n"); );
    // Body
    a = VL_RAND_RESET_I(1);
    b = VL_RAND_RESET_I(1);
    cin = VL_RAND_RESET_I(1);
    y = VL_RAND_RESET_I(1);
    out = VL_RAND_RESET_I(1);
}
