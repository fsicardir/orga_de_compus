#ifndef BASE64_BASE64_H
#define BASE64_BASE64_H

#define PADDING_CHAR '='

/*
 * Encodes the given array of octets to base64 and stores the result into the given sextets array.
 * missing_octets is the amount of octets missing in the octets array
 */
void base64_encode(unsigned const char octets[3], unsigned char sextets[4], int missing_octets);

/*
 * Decodes the given array of sextets from base64 and stores the result into the given octets array.
 */
void base64_decode(unsigned const char sextets[4], unsigned char octets[3]);

#endif //BASE64_BASE64_H
