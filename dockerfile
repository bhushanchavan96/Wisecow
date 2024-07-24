
#This is the new changes

# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/games:${PATH}"

# Install required packages
RUN apt-get update && \
    apt-get install -y fortune cowsay netcat-openbsd git

# Download the GitHub repository
RUN git clone https://github.com/nyrahul/wisecow.git /opt/wisecow

# Set working directory
WORKDIR /opt/wisecow

# Make the script executable
RUN chmod +x wisecow.sh

# Expose port (replace 4499 with the port your script uses)
EXPOSE 4499

# Run the script and then keep the container running
CMD ["sh", "-c", "./wisecow.sh"]


