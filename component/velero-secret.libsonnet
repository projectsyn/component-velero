// main template for velero
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.velero;


local backupstoragelocationSecret(secret) = kube.Secret(secret) {
  metadata+: {
    namespace: params.namespace,
  },
  stringData+: {
    [secretData]: params.secrets[secret][secretData]
    for secretData in std.objectFields(params.secrets[secret])
  },
};

// Define outputs below
{
  ['backupstoragelocation-secret-' + secret]: backupstoragelocationSecret(secret)
  for secret in std.objectFields(params.secrets)
}
