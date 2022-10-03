
# Function uses to connect to virtual machine through SSH Client
function Connect-Linux {
  param (
    [string]$IPAddr,
    [string]$Username,
    [string]$Shell
  )
  if ($Shell -in "tmux", "Tmux", "TMUX"){
    ssh $Username@$IPAddr -t -- /bin/zsh -c 'tmux has-session && exec tmux attach || exec tmux'
  }
      <#
        .SYNOPSIS
        Easily Connects to a virtual machine through SSH Client

        .DESCRIPTION
        Connect-Linux is a comprehension alias way in case to ssh connect vmware or virtualbox through powershell from host.

                                                        Written by: 0x65dvrc

        .PARAMETER Name
        Specifies the file name.

        .EXAMPLE
        PS> Connect-Linux -IPAddr <ip-addr> -Username <username> -Shell <shell>

        .LINK
        Connet-Linux
    #>
  else {
    ssh $Username@$IPAddr
  }
}


# Export Module
Export-ModuleMember -Function Connect-Linux