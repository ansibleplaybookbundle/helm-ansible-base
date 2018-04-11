FROM ansibleplaybookbundle/helm-bundle-base

USER root
COPY playbooks /opt/apb/actions
COPY roles /opt/ansible/roles
COPY overrides.yml.j2 /opt/overrides.yml.j2
RUN chmod -R g=u /opt/{ansible,apb,overrides.yml.j2}
USER apb

ENTRYPOINT ["entrypoint.sh"]
