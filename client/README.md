## Client React
#### Install
First thing run `npm install` to get all node dependencies.

#### Build
As the rails application will require the javascript bundle (`app/assets/react/react-bundle.js`).
The file must be generated manually at the moment: run `npm run build:client`

##### Watch & Build
For webpack to watch the changes in `client/app/`, run `npm run watch:client`

#### Hot Module Replacement (HRM)
Webpack offers the awesome HRM feature, which can be used to live-reload the React client app after any change, without the need of refreshing the page.
*TODO*