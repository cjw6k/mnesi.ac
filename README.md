# contrib@mnesi.ac

An experimental system for self-publishing.

NOTE: incomplete, wip

## Installation

Welcome author!

Choose a handle, or a domain of your own. In the following steps where `handle` appears, go with your **author's choice**.

### Quick Start

lol

### Development

#### Windows 11 w/ WSL2 and Docker Desktop.

1. Open the Microsoft Store and GET a fresh Ubuntu. _Author recommends: [Ubuntu 22.04.3](ms-windows-store://pdp/?ProductId=9PN20MSR04DW) ([http](https://apps.microsoft.com/detail/9PN20MSR04DW))._

   1. OPEN the app and set a username: `handle`

   2. Choose a strong password! _Author recommends: store it in [1password](https://1password.com/) as a new `Server` item named `handle`._

   3. Exit the Ubuntu app.

   4. Exit the Microsoft Store.

2. (Optional; Recommended) Relocate the WSL distro.

   1. Open a shell and list the `wsl` distros.

   2. Export the distro.

   3. Import the distro as `Handle`. _Here we store the filesystem on hardware shared with the OS and mounted at `C:`. Author recommends dedicated hardware._

      ```shell
      wsl -l
      wsl --export Ubuntu-22.04.3 Handle.tar
      wsl --import Handle C:\Handle Handle.tar
      wsl --unregister Ubuntu-22.04
      rm Handle.tar
      ```

3. WSL Customizations for Handle

   1. Launch the Handle distro in WSL.

   2. Set the default user to `handle` and exit.

   3. Stop the Handle distro. *`handle` is the default user when the distro is restarted.*

      ```shell
      wsl -d Handle
      echo $'\n'[user]$'\n'default=handle >> /etc/wsl.conf
      exit
      wsl -t Handle
      ```

4. Enable Docker Desktop integration with Handle.

   1. Open [Docker Desktop](https://www.docker.com/products/docker-desktop/).

   2. Navigate to Settings > Resources > WSL Integration.

   3. Toggle on integration w/ Handle.

   4. Apply the changes and restart Docker Desktop.

5. Bootstrap the Handle distro.

   1. Launch the Handle distro in WSL.

   2. Clone the repo. *Author recommends: fork cjw6k/mnesi.ac and get a clone of your own e.g. `git clone git@github.com:you/handle.git --branch=contrib /opt/contrib`*

   3. Run the bootstrap script.

      ```shell
      wsl -d Handle
      sudo mkdir /opt/contrib
      sudo chown handle:handle /opt/contrib
      git clone git@github.com:cjw6k/mnesi.ac.git --branch=contrib /opt/contrib
      cd /opt/contrib
      bootstrap/wsl-ubuntu-22.04.3.sh
      ```

6. to be continued
