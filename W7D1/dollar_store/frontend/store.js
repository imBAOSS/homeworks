import {createStore} from "redux";
import reducer from "./reducer.js";

const store = createStore(reducer);

window.store = store;

export default store;
