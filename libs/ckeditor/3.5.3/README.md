# ⚠ This repository is no longer maintained ⚠

## CKEditor 3.5 for Java - Samples

**Important Note**

This project was supposed to show how CKEditor 3.5 for Java integration can be used inside a web application. It has not been completed, use it at your own risk.

Please note that CKEditor is a JavaScript editor and as such may work with any web application, regardless of the server-side language that the project is using, including Java-based apps. A dedicated "server-side integration" is not required to include CKEditor 3.5 in your application.

## Getting the code

To use the code you need to clone it into local directory of your choice, using below command:

    git clone https://bitbucket.org/proxymlr/ckeditor-java-sample

After cloning the repository you also may need to initialize and update the CKEditor submodule (unnecessary now):

    git submodule update --init --recursive

## Building war file with maven wrapper

    ./mvnw clean
    ./mvnw package

## Documentation

The full developer documentation for the CKEditor for Java integration is available online at: http://link-to-docs.com

## License

Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see src/main/webapp/LICENSE.html or http://ckeditor.com/license
