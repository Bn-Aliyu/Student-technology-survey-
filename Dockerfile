# Use a lightweight web server for static files
FROM nginx:alpine

# Copy HTML files to nginx
COPY *.html /usr/share/nginx/html/
COPY image/ /usr/share/nginx/html/image/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
