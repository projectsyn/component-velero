// main template for velero
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.velero;

// Define outputs below
{
  ['schedule-' + schedule.name]: {
    apiVersion: 'velero.io/v1',
    kind: 'Schedule',
    metadata: {
      name: schedule.name,
      namespace: params.namespace,
    },
    spec: schedule.spec,
  }
  for schedule in params.schedules
}
