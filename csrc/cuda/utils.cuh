#pragma once

#include "../extensions.h"

#define CHECK_CUDA(x)                                                          \
  AT_ASSERTM(x.device().is_cuda(), #x " must be CUDA tensor")
#define CHECK_INPUT(x) AT_ASSERTM(x, "Input mismatch")

__device__ __inline__ at::Half __shfl_up_sync(const unsigned mask,
                                              const at::Half var,
                                              const unsigned int delta) {
  return __shfl_up_sync(mask, var.operator __half(), delta);
}

__device__ __inline__ at::Half __shfl_down_sync(const unsigned mask,
                                                const at::Half var,
                                                const unsigned int delta) {
  return __shfl_down_sync(mask, var.operator __half(), delta);
}

#ifdef USE_ROCM
__device__ __inline__ at::Half __ldg(const at::Half* ptr) {
  return __ldg(reinterpret_cast<const __half*>(ptr));
}
#endif
