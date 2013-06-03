# What's Going On
A LocalWiki-backed community directory of after school programs.

## Requirements

### Website
The What's Going On main website site is built on the Emergence PHP framework and engine, and requires an Emergence server to host it.

Emergence should be easy to setup on any Mac or Linux system, but the installation guide is currently only maintained for Gentoo Linux: http://emr.ge/manual/installing_gentoo

Also, ready-to-go image is available on Amazon's AMI database: https://aws.amazon.com/amis/emergence

Free unlimited Emergence hosting is also available for civic projects on-request from calfano@codeforamerica.org

### Mobile WebApp
The mobile webapp client for searching is built with the Sencha Touch 2.1.1 framework. The source code for the application is under sencha-workspace/WhatsGoingOn with some external classes required from ext-library. The web app can be hosted via any static HTTP server, but is currently configured to route all LocalWiki API calls through an emergence-dependent PHP script that blindly proxies requests through to the remote LocalWiki instance. This could be replaced with any cross-origin solution to adapt the webapp to a different backend stack.

## Installation from Git
-  Create an emergence site that extends 8U6kydil36bl3vlJ@skeleton.emr.ge
-  Upload contents of git repository using WebDAV client (CyberDuck is best open-source option)

## Installation via Emergence (linked child)
-  Create an emergence site that extends 7IqJsQ9saU7rzYFP@whatsgoingon.citiesinthecloud.com
