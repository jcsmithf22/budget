import {Controller} from "@hotwired/stimulus";
import {computePosition, shift, offset} from "@floating-ui/dom";

// Connects to data-controller="popover"
export default class extends Controller {
    static targets = ["card", "content", "button"];
    static values = {url: String};

    async show(event) {
        // Temporally variable to prevent `event.currentTarget` to being null.
        // const element = event.currentTarget
        let content = null;

        if (this.hasContentTarget) {
            content = this.contentTarget.innerHTML;
        }

        if (!content) return;

        // setTimeout(() => {
        //
        // }

        const fragment = document.createRange().createContextualFragment(content);
        const node = this.element.appendChild(fragment);

        computePosition(this.buttonTarget, this.cardTarget, {
            placement: 'top',
            middleware: [offset(4), shift({padding: 4})]
        }).then(({x, y}) => {
            Object.assign(this.cardTarget.style, {
                left: `${x}px`,
                top: `${y}px`,
            });
        });
        // console.log(this.element)
    }

    hide() {
        if (this.hasCardTarget) {
            this.cardTarget.remove();
        }
    }
}
