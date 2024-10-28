import {Controller} from "@hotwired/stimulus";

// Connects to data-controller="popover"
export default class extends Controller {
    static targets = ["card", "content"];
    static values = {url: String};

    async show(event) {
        // Temporally variable to prevent `event.currentTarget` to being null.
        // const element = event.currentTarget
        let content = null;

        if (this.hasContentTarget) {
            content = this.contentTarget.innerHTML;
        }

        if (!content) return;

        const fragment = document.createRange().createContextualFragment(content);
        this.element.appendChild(fragment);
        // console.log(this.element)
    }

    hide() {
        if (this.hasCardTarget) {
            this.cardTarget.remove();
        }
    }
}
