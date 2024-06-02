{ config, pkgs, ... }:
{
  networking = {
    extraHosts = ''
      # Host addresses
      127.0.0.1  localhost
      127.0.1.1  ${config.networking.hostName}
      ::1        localhost ip6-localhost ip6-loopback
      ff02::1    ip6-allnodes
      ff02::2    ip6-allrouters

      192.168.22.10 git.kyros.com.br
      192.168.22.11 canary-dev.kyros.com.br

      192.168.1.244 archiva.kyros.com.br

      192.168.22.11 worktrix-dev.kyros.com.br
      192.168.22.11 workplayer-dev.kyros.com.br
      192.168.22.11 planeon-dev.kyros.com.br
      192.168.22.11 redis-dev.kyros.com.br
      192.168.22.11 n8n-dev.kyros.com.br
      192.168.22.11 kyros-open-storage-dev.com.br
      192.168.22.11 sso-hom.kyros.com.br
      192.168.22.11 midas-dev.kyros.com.br

      192.168.0.95 kyros-resource.kyros.com.br
      192.168.0.95 file-manager-dev.kyros.com.br
      192.168.0.95 engajamento-dev.kyros.com.br
      192.168.0.95 redis.kyros.com.br
      192.168.0.95 planeon.kyros.com.br

      172.20.0.100 zabbix.algartelecom.com.br
    '';
  };
}
