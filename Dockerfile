FROM php:7.4-fpm

# Set working directory
WORKDIR /var/www/html

# Install required packages
RUN apt-get update && apt-get install -y curl libpng-dev libonig-dev libxml2-dev libzip-dev zip npm && \
    docker-php-ext-configure zip && \
    docker-php-ext-install zip pdo pdo_mysql mbstring exif pcntl bcmath gd && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Copy code in docker env
COPY ./php-hello-world-main /var/www/html

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --dev --prefer-dist

# Set permissions for the working directory
RUN chown -R www-data:www-data /var/www/html

# Expose port 9000 and start PHP-FPM server
EXPOSE 9000
# CMD ["php-fpm"]