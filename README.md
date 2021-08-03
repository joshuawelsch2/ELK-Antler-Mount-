## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram]](Diagrams/myazurenetwork.drawio)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible file may be used to install only certain pieces of it, such as Filebeat.

  - [Elk Install](Ansible/install-elk.yml)
  - [Filebeat](Ansible/install-filebeat.yml)
  - [Metricbeat](Ansible/install-metricbeat.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

NOTE: Included in this depository are also beginner Bash scripts which, while not important for the ELK stack, were required by my instructors.

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balencers are able to shift the direction of oncoming attack traffic, as well as serve as a point fo communication between different containers. 
- Jumpboxes allow for a a single point of entry into a remote network, which is easily monitored and secured by SSH.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system resources.

- Filebeat gathers log files which monitor login attempts, sudo usage, and New User and Group creation, and forward those files to Elasticsearch.
- Metricbeat records CPU and Memory Useage, as well as Network Input/Output and forwards the results to Elasticsearch. This allows us to monitor system resources and see if they are being used benefically.

The configuration details of each machine may be found below.
| Name     | Function   | IP Address | OS    |
|----------|------------|------------|-------|
| Jump Box | Gateway    | 10.0.0.4   | Linux |
| Web-1    | Web Server | 10.0.0.6   | Linux |
| Web-2    | Web Server | 10.0.07    | Linux |
| AllenBox | ELK Stack  | 10.1.0.5   | Linux |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
 - 135.84.199.29

Machines within the network can only be accessed by the Jumpbox Machine.
- Jumpbox
  Public IP: *dynamic*
  Private IP: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible     | Allowed IP Addresses   |
|----------|-------------------------|------------------------|
| Jump Box | 22 - SSH - Yes          | 135.84.199.29          |
| Web-1,2  | No                      | Web LB - 168.62.206.25 |
| Web LB   | HTTP - 80 - Yes         | *                      |
| AllenBox | Kibana - 5601 - Yes     | *                      |
| AllenBox | HTTP - API - 9200 - Yes | 10.0.0.0/16            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because when automation is configured with Ansible, it allows IT admins to minimize error in server configuration and to focus on more important tasks.

The playbook implements the following tasks:

- Install Docker: *configures the core code to the server*
- Install Python3_pip: *this module allows for a smoother installation of the following Docker module across all of the machines*
- Install Docker Module: *refers back to the pip module and begins installation*
- Increase Memory: *allocates more memory to the ELK server allows for the setup to occur*
- Downlaod and Launch ELK Container: *downloads the ELK container and launches it with the preconfigured available ports*

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

[docker ps output](Screenshots/psdockeroutput.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1 (10.0.0.6)
- Web2 (10.0.0.7)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat gathers log files which monitor login attempts, sudo usage, and New User and Group creation, and forward those files to Elasticsearch.

[Filebeat Output](Screenshots/syslogdashboardfilebeat.jpg)

- Metricbeat records CPU and Memory Useage, as well as Network Input/Output and forwards the results to Elasticsearch. This allows us to monitor system resources and see if they are being used benefically.

[Metricbeat Output](Screenshots/metricbeatdockerdashboard.jpg)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles/install-elk.yml.
- Update the hosts file to include the ELK attribute, with the IP address of your ELK VM as seen below:
 - (Screenshots/elk attribution in the hosts file.jpg)
- Run the playbook, and navigate to http://[your_elk_server_ip]:5601/app/kibana to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

Commands to get and run the ELK playbook:
 - curl https://github.com/joshuawelsch2/ELK-Antler-Mount/main/Ansible/install-elk.yml > /etc/ansible/roles/install-elk.yml
 - change the *hosts* file in /etc/ansible and add the following, substituting your own IP address.
   - (Screenshots/elk attribution in the hosts file.jpg)
 - Command to run the playbook: 'ansible-playbook /etc/ansible/roles/install-elk.yml'
 - Validate that the installation has been completed without error by visiting http://[your_elk_server_ip]:5601/app/kibana
  - The desired output: 
<<<<<<< Updated upstream
  - [Kibana Dashboard](Screenshots/kibanafrontpage.jpg)
=======
   - [Kibana Dashboard](Screenshots/kibanafrontpage.jpg)
>>>>>>> Stashed changes

Commands to install Filebeat:
 - curl https://github.com/joshuawelsch2/ELK-Antler-Mount/main/Ansible/install-filebeat.yml > /etc/ansible/roles/install-filebeat.yml
 - command to run the playbook: 'ansible-playbook /etc/ansible/roles/install-filebeat.yml'
 - Validate the the setup ran without errors by going into your kibana app and clocking: add log data -> system logs -> system log dashboard.
 - The desired output:
  - [Filebeat Dashboard](Screenshots/syslogdashboardfilebeat.jpg)

Commands to install Metricbeat:
 -  curl https://github.com/joshuawelsch2/ELK-Antler-Mount/main/Ansible/install-metricbeat.yml > /etc/ansible/roles/install-metricbeat.yml
 - command to run the playbook: 'ansible-playbook /etc/ansible/roles/install-metricbeat.yml'
 - Validate the the setup ran without errors by going into your kibana app and clocking: add metric data -> Docker metrics -> Docker metrics dashboard.
 - The desired output:
<<<<<<< Updated upstream
  - [Metricbeat Dashboard](Screenshots/metricbeatdockerdashboard.jpg)
=======
  - [Metricbeat Dashboard](Screenshots/metricbeatdockerdashboard.jpg)
>>>>>>> Stashed changes
