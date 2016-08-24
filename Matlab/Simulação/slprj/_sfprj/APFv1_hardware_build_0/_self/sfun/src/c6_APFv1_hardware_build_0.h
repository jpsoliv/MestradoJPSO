#ifndef __c6_APFv1_hardware_build_0_h__
#define __c6_APFv1_hardware_build_0_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc6_APFv1_hardware_build_0InstanceStruct
#define typedef_SFc6_APFv1_hardware_build_0InstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c6_sfEvent;
  boolean_T c6_isStable;
  boolean_T c6_doneDoubleBufferReInit;
  uint8_T c6_is_active_c6_APFv1_hardware_build_0;
} SFc6_APFv1_hardware_build_0InstanceStruct;

#endif                                 /*typedef_SFc6_APFv1_hardware_build_0InstanceStruct*/

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c6_APFv1_hardware_build_0_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c6_APFv1_hardware_build_0_get_check_sum(mxArray *plhs[]);
extern void c6_APFv1_hardware_build_0_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
