import pyotherside
import math

def render(image_id, requested_size):
    print('image_id: "{image_id}", size: {requested_size}'.format(**locals()))

    # width and height will be -1 if not set in QML
    if requested_size == (-1, -1):
        requested_size = (300, 300)

    width, height = requested_size

    # center for circle
    cx, cy = width/2, 10

    pixels = []
    for y in range(height):
        for x in range(width):
            pixels.extend(reversed([
                255, # alpha
                int(10 + 10 * ((x - y * 0.5) % 20)), # red
                20 + 10 * (y % 20), # green
                int(255 * abs(math.sin(0.3*math.sqrt((cx-x)**2 + (cy-y)**2)))) # blue
            ]))
    return bytearray(pixels), (width, height), pyotherside.format_argb32

pyotherside.set_image_provider(render)