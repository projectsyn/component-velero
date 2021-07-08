// main template for velero
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.velero;

// Define outputs below
{
  '00_namespace': kube.Namespace(params.namespace),
}
+ (import 'velero-secret.libsonnet')
+ (import 'velero-backupstoragelocation.libsonnet')
+ (import 'velero-schedule.libsonnet')
