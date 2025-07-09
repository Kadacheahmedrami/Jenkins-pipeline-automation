# Use the official WordPress base image
FROM wordpress:latest

# Copy your local site into the container’s web root
COPY ./wordpress-site /var/www/html

# Ensure proper ownership & permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# (Optional) Expose port 80 if you run this standalone
EXPOSE 80

# Entrypoint & CMD inherited from wordpress:latest
