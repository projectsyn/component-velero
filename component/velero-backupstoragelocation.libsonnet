// main template for velero
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.velero;

// Define outputs below
{
  ['backupstoragelocation-' + backupstoragelocation.name]: {
    apiVersion: 'velero.io/v1',
    kind: 'BackupStorageLocation',
    metadata: {
      name: backupstoragelocation.name,
      namespace: params.namespace,
    },
    spec: backupstoragelocation.spec,
  }
  for backupstoragelocation in params.backupstoragelocations
}
