/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './srcjs/**/*.{js,jsx,ts,tsx}'],
    './inst/htmlwidgets/**/*.{html,js,jsx,ts,tsx}'
     ],
    theme: {
        transparent: 'transparent',
        current: 'currentColor',
        'base-blue': '#1F7BE5',
        'hover-blue': '#005CC6',
        extend: {},
    },
    plugins: [],
    prefix: 'tr-',
};
