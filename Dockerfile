FROM nginx:alpine

# Remove default nginx config
RUN rm -rf /etc/nginx/conf.d/default.conf

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy HTML files
COPY . /usr/share/nginx/html

# Remove unnecessary files from html directory
RUN rm -f /usr/share/nginx/html/Dockerfile \
    && rm -f /usr/share/nginx/html/.git* \
    && rm -f /usr/share/nginx/html/.gitignore

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
