local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.velero;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('velero', params.namespace);

{
  velero: app,
}
