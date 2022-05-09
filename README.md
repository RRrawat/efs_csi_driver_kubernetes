# kubernetes_efs_csi_driver
Terraform module for deploying aws-efs-csi-driver inside a pre-existing EKS cluster.

The Amazon Elastic File System Container Storage Interface (CSI) Driver implements the CSI specification for container orchestrators to manage the lifecycle of Amazon EFS file systems.
Examples
Before the example, you need to:

Get yourself familiar with how to setup Kubernetes on AWS and how to create EFS file system.
When creating EFS file system, make sure it is accessible from Kubernetes cluster. This can be achieved by creating the file system inside the same VPC as Kubernetes cluster or using VPC peering.
Install EFS CSI driver using this module.
Example links
Static provisioning
Dynamic provisioning
Encryption in transit
Accessing the file system from multiple pods
Consume EFS in StatefulSets
Mount subpath
Use Access Points
Encryption In Transit
One of the advantages of using EFS is that it provides encryption in transit support using TLS. Using encryption in transit, data will be encrypted during its transition over the network to the EFS service. This provides an extra layer of defence-in-depth for applications that requires strict security compliance.

Encryption in transit is enabled by default in the master branch version of the driver. To disable it and mount volumes using plain NFSv4, set volumeAttributes field encryptInTransit to "false" in your persistent volume manifest. For an example manifest, see Encryption in Transit Example.

Note Kubernetes version 1.13+ is required if you are using this feature in Kubernetes.
