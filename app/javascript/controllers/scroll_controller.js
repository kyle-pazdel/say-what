import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  /** On start */
  connect() {
    console.log("Connected");
    const conversation = document.getElementById("conversation");
    conversation.addEventListener("DOMNodeInserted", this.resetScroll);
    this.resetScroll(conversation);
    // console.log(conversation);
  }
  /** On stop */
  disconnect() {
    console.log("Disconnected");
  }
  /** Custom function */
  resetScroll() {
    const conversation = document.getElementById("conversation");
    const messageHeader = document.getElementById("message-header");
    const navbar = document.getElementById("navbar");
    conversation.scrollTop = conversation.scrollHeight - conversation.clientHeight;
    // console.log(conversation.offsetHeight);
    // console.log(conversation.clientHeight);
    // console.log(conversation.scrollHeight);
    // console.log(messageHeader.clientHeight);
    // console.log(navbar.offsetHeight);
  }
}
