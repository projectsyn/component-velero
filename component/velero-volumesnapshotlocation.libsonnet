// main template for velero
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.velero;

// Define outputs below
{
  ['volumeSnapshotlocation-' + volumeSnapshotlocation.name]: {
      apiVersion: 'velero.io/v1',
      kind: 'VolumeSnapshotLocation',
      metadata: {
        name: volumeSnapshotlocation.name,
        namespace: params.namespace,
      },
      spec: volumeSnapshotlocation.spec
  }
  for volumeSnapshotlocation in params.volumesnapshotlocations
}
