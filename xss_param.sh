#!/bin/bash

# Define query parameters to check for
params_to_check=(
    'utm_campaign=' 'utm_source=' 'utm_medium=' 'message=' 'link=' 'url=' 'query=' 'lang='
    'title=' 'name=' 'search=' 'keyword=' 'q=' 'term=' 'query_string=' 'input=' 'data='
    'username=' 'password=' 'email=' 'phone=' 'address=' 'city=' 'state=' 'zipcode=' 'country='
    'comment=' 'description=' 'body=' 'content=' 'page=' 'category=' 'tag=' 'subject=' 'recipient='
    'sender=' 'author=' 'recipient_name=' 'sender_name=' 'author_name=' 'to=' 'from=' 'cc=' 'bcc='
    'redirect=' 'return_url=' 'callback=' 'callback_url=' 'return_to=' 'redirect_uri=' 'target='
    'destination=' 'referrer=' 'referer=' 'next=' 'continue=' 'link_url=' 'href=' 'source=' 'file='
    'image=' 'avatar=' 'picture=' 'profile=' 'thumbnail=' 'script=' 'javascript=' 'onload=' 'onerror='
    'onmouseover=' 'onmouseout=' 'onclick=' 'onfocus=' 'onblur=' 'onsubmit=' 'onkeydown=' 'onkeyup='
    'onkeypress=' 'onresize=' 'onchange=' 'onselect=' 'oncontextmenu=' 'ondblclick=' 'onmousedown='
    'onmouseup=' 'onmousemove=' 'onmouseenter=' 'onmouseleave=' 'onwheel=' 'oncut=' 'oncopy=' 'onpaste='
    'onabort=' 'onhashchange=' 'oninput=' 'onmessage=' 'ononline=' 'onoffline=' 'onpopstate=' 'onreset='
    'onscroll=' 'onstorage=' 'onunload=' 'onbeforeunload=' 'onpageshow=' 'onpagehide=' 'onreadystatechange='
    'onsearch=' 'onloadstart=' 'onprogress=' 'ontoggle=' 'onplay=' 'onpause=' 'onended=' 'onseeking='
    'onseeked=' 'onloadedmetadata=' 'onloadeddata=' 'onsuspend=' 'onstalled=' 'oncanplay=' 'oncanplaythrough='
    'ondurationchange=' 'onratechange=' 'onvolumechange=' 'ontimeupdate=' 'onerror=' 'onwaiting=' 'onbeforeinput='
    'onanimationstart=' 'onanimationend=' 'onanimationiteration=' 'ontransitionstart=' 'ontransitionend=' 'ontransitioncancel='
    'onscroll=' 'oninvalid=' 'onsubmit=' 'onreset=' 'oncopy=' 'oncut=' 'onpaste=' 'find_projects=' 'f=' 'id='
)

# Function to extract URLs containing specific query parameters
extract_urls() {
    while IFS= read -r line; do
        for param in "${params_to_check[@]}"; do
            if [[ "$line" == *"$param"* ]]; then
                echo "$line"
                break
            fi
        done
    done < "$1" > urls_with_specific_parameters.txt
}

# Main script logic
main() {
    if [[ ! -f "$1" ]]; then
        echo "Usage: $0 <file>"
        echo "Please provide a valid file containing URLs."
        exit 1
    fi

    echo "Extracting URLs with specific parameters from $1..."
    extract_urls "$1"
    echo "Extraction completed. Results saved in urls_with_specific_parameters.txt"
}

# Check if script is executed with a file argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Execute main script
main "$1"
