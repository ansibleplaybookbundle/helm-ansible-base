# helm-ansible-base

This base image can be used interchangeably with the `helm-bundle-base` image.
It uses ansible to run helm and then create or delete cluster resources as
appropriate.

## Adding Behaviors

This base image is primarily valuable if you want to perform additional actions
using ansible before and/or after helm runs.

In order to do so, you would:

1. Create a new APB that uses this as the base image.
2. Ensure that the helm chart gets placed at `/opt/chart.tgz`
3. Use the `helm-ansible-base` ansible role from your provision and deprovision
   playbooks. See its [README](roles/helm-ansible-base/README.md) for
   additional details.
4. Create one or more roles to perform additional actions.

## Override Chart Values

You can optionally create an ansible-compatible jinja template and put it at
the path specified by the `hb_overrides_template` variable. The template must
render YAML, and that will be used to override any values specified in the
chart's values.yaml file by using helm's `--values` command-line feature.

This file may be a subset of the settings in the chart's values.yaml. You only
need to include values that you wish to set.

## Rich Parameters

You can richly define parameters in `apb.yml` and then directly reference them
in an overrides template. For example you could add this parameter to your
`apb.yml`:

```
  - name: blog_title
    title: Title for your blog
    type: string
    required: true
```

That value can be referenced directly in `overrides.yml.j2`:

```
---
blog:
  title: "{{ blog_title }}"
```

## Settings

See the [defaults](roles/helm-ansible-base/defaults/main.yml) file for details
on variables that can be set.
