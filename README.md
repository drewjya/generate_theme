# generate_theme

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

## Description

Tools to automate theme extension for your applications.

## Features

- Automate the creation of color, text styles, and font sizes.
- Create themes by simply providing a configuration JSON.

## Installation Instructions

To install the `generate_theme` brick, add it to your Mason project by running:

```bash
dart pub global activate mason_cli
mason init
mason add generate_theme
mason make generate_theme -c config.json
```

## Usage

To use the `generate_theme` brick, provide a configuration JSON file with your desired theme settings. For example:

```json
{
    "colors": [
        {
            "name": "primary",
            "hex": "#315BF0"
        },
        {
            "name": "onPrimary",
            "dark": "#FFFFFF",
            "light": "#000000"
        }
    ],
    "fontSizes": [
        {
            "name": "small12",
            "size": 12
        }
    ],
    "fontFamily": "Manrope",
    "textExtension": [
        {
            "name": "onPrimary",
            "theme": "true"
        },
        {
            "name": "primary"
        }
    ],
    "colorExtension": [
        {
            "name": "primary"
        },
        {
            "name": "onPrimary",
            "theme": "true"
        }
    ]
}
```

## Contributing

We welcome contributions! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License.
