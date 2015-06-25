<#
.SYNOPSIS
   Launch Interactive Elixir
.NOTES
   AUTHOR: Onorio Catenacci catenacci@ieee.org

Version: 0.01
Date: 25 June 2015

#>

&elixir.ps1 +iex --erl "-user Elixir.IEx.CLI" --no-halt %*
