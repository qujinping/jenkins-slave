FROM core/jenkins-slave-base-centos7

LABEL com.redhat.component="jenkins-slave-image-mgmt" \
      name="jenkins-slave-image-mgmt" \
      architecture="x86_64" \
      io.k8s.display-name="Jenkins Slave Image Management" \
      io.k8s.description="Image management tools on top of the jenkins slave base image" \
      io.openshift.tags="openshift,jenkins,slave,copy"

USER root

COPY etc/policy.json /etc/containers/
COPY ./skopeo /usr/bin 
COPY ./kompose /usr/bin 

RUN chown -R 1001:0 /etc/containers $HOME /usr/bin/skopeo /usr/bin/kompose && \
    chmod -R g+rw /etc/containers $HOME /usr/bin/skopeo /usr/bin/kompose

USER 1001
