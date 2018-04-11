# helm-ansible-base role

## Notable settings

`hb_k8s_action` - This must be set to `create` for provision and `delete` for
deprovision. It defaults to "create".

`hb_release_name` - This corresponds to the "release" value used by helm. Every
object in the namespace with a label that has key `release` and this value will
be deleted during deprovision. The label is auto-added by helm to resources it
creates; you may add the label to other resources you create during provision
through non-helm means if you want them to be auto-deleted during deprovision.
