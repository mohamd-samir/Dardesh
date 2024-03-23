/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/trace/v3/xray.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/msg_internal.h"
#include "envoy/config/trace/v3/xray.upb.h"
#include "envoy/config/core/v3/address.upb.h"
#include "envoy/config/core/v3/base.upb.h"
#include "google/protobuf/struct.upb.h"
#include "udpa/annotations/migrate.upb.h"
#include "udpa/annotations/status.upb.h"
#include "udpa/annotations/versioning.upb.h"
#include "validate/validate.upb.h"

#include "upb/port_def.inc"

static const upb_MiniTable_Sub envoy_config_trace_v3_XRayConfig_submsgs[3] = {
  {.submsg = &envoy_config_core_v3_SocketAddress_msginit},
  {.submsg = &envoy_config_core_v3_DataSource_msginit},
  {.submsg = &envoy_config_trace_v3_XRayConfig_SegmentFields_msginit},
};

static const upb_MiniTable_Field envoy_config_trace_v3_XRayConfig__fields[4] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 32), UPB_SIZE(2, 2), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 40), UPB_SIZE(3, 3), 2, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_config_trace_v3_XRayConfig_msginit = {
  &envoy_config_trace_v3_XRayConfig_submsgs[0],
  &envoy_config_trace_v3_XRayConfig__fields[0],
  UPB_SIZE(24, 48), 4, kUpb_ExtMode_NonExtendable, 4, 255, 0,
};

static const upb_MiniTable_Sub envoy_config_trace_v3_XRayConfig_SegmentFields_submsgs[1] = {
  {.submsg = &google_protobuf_Struct_msginit},
};

static const upb_MiniTable_Field envoy_config_trace_v3_XRayConfig_SegmentFields__fields[2] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(12, 24), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy_config_trace_v3_XRayConfig_SegmentFields_msginit = {
  &envoy_config_trace_v3_XRayConfig_SegmentFields_submsgs[0],
  &envoy_config_trace_v3_XRayConfig_SegmentFields__fields[0],
  UPB_SIZE(16, 32), 2, kUpb_ExtMode_NonExtendable, 2, 255, 0,
};

static const upb_MiniTable *messages_layout[2] = {
  &envoy_config_trace_v3_XRayConfig_msginit,
  &envoy_config_trace_v3_XRayConfig_SegmentFields_msginit,
};

const upb_MiniTable_File envoy_config_trace_v3_xray_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  2,
  0,
  0,
};

#include "upb/port_undef.inc"

