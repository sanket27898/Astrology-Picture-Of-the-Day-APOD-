# arkroot_technologies_apod_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



The following is the task assigned to you. 

    Create a flutter web application to show Astrology Picture Of the Day (APOD) and its details. The following functionalities are required.

        A date picker to select a particular date.
        A "Find" button to fetch APOD of the selected date from the server.
        Initially, the dashboard should load the APOD of today.

    GET REQUEST: https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=2017-07-10

    Some good practices to follow:

        Use a State-Management solution to reduce the usage of the Stateful Widget.
        The codebase should be well maintained and can follow any architecture (preferred MVVM).
        The screen should be responsive and reduce render flex error. This problem can be handled by adjusting the aspect ratio and flex values.
        Use powerful HTTP clients such as dio to handle the API calls.
        Show loading progress while fetching data.
        UI/UX should have a minimum standard. Use proper aligning and themes.
