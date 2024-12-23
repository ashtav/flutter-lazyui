String camelize(String input) => input
    .split('_')
    .map((word) => word[0].toUpperCase() + word.substring(1))
    .join('');
