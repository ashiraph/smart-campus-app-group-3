#!/usr/bin/env python3
"""
Generate MUST Smart Campus App Icon
Creates a 1024x1024 PNG icon with campus navigation theme
"""

try:
    from PIL import Image, ImageDraw, ImageFont
    import os
except ImportError:
    print("Installing required package: Pillow")
    import subprocess
    subprocess.check_call(['pip', 'install', 'Pillow'])
    from PIL import Image, ImageDraw, ImageFont
    import os

def create_campus_icon():
    # Create 1024x1024 image
    size = 1024
    img = Image.new('RGB', (size, size), color='white')
    draw = ImageDraw.Draw(img)
    
    # Background gradient (blue)
    for y in range(size):
        r = int(25 + (33 - 25) * y / size)
        g = int(118 + (150 - 118) * y / size)
        b = int(210 + (243 - 210) * y / size)
        draw.rectangle([(0, y), (size, y+1)], fill=(r, g, b))
    
    # Campus Building (white)
    building_width = 400
    building_height = 300
    building_x = (size - building_width) // 2
    building_y = size // 2 - 50
    
    # Building body
    draw.rounded_rectangle(
        [(building_x, building_y), (building_x + building_width, building_y + building_height)],
        radius=20,
        fill=(255, 255, 255, 240)
    )
    
    # Windows (blue)
    window_color = (25, 118, 210, 180)
    
    # Top row windows
    for i in range(3):
        window_x = building_x + 60 + (i * 120)
        window_y = building_y + 60
        draw.rounded_rectangle(
            [(window_x, window_y), (window_x + 80, window_y + 60)],
            radius=8,
            fill=window_color
        )
    
    # Bottom row windows
    for i in range(3):
        window_x = building_x + 60 + (i * 120)
        window_y = building_y + 150
        draw.rounded_rectangle(
            [(window_x, window_y), (window_x + 80, window_y + 60)],
            radius=8,
            fill=window_color
        )
    
    # Door (dark blue)
    door_x = building_x + 160
    door_y = building_y + 230
    draw.rounded_rectangle(
        [(door_x, door_y), (door_x + 80, door_y + 70)],
        radius=8,
        fill=(21, 101, 192)
    )
    
    # Door handle (gold)
    draw.ellipse(
        [(door_x + 35, door_y + 30), (door_x + 45, door_y + 40)],
        fill=(255, 215, 0)
    )
    
    # Roof (dark blue triangle)
    roof_points = [
        (building_x - 40, building_y),
        (size // 2, building_y - 100),
        (building_x + building_width + 40, building_y)
    ]
    draw.polygon(roof_points, fill=(21, 101, 192))
    
    # Location Pin (red)
    pin_x = size // 2 + 200
    pin_y = size // 2 - 200
    
    # Pin shadow
    draw.ellipse(
        [(pin_x - 40, pin_y + 165), (pin_x + 40, pin_y + 195)],
        fill=(0, 0, 0, 50)
    )
    
    # Pin body (red)
    pin_points = [
        (pin_x, pin_y - 100),
        (pin_x - 60, pin_y - 80),
        (pin_x - 90, pin_y - 30),
        (pin_x - 90, pin_y + 20),
        (pin_x, pin_y + 80),
        (pin_x + 90, pin_y + 20),
        (pin_x + 90, pin_y - 30),
        (pin_x + 60, pin_y - 80),
    ]
    draw.polygon(pin_points, fill=(255, 82, 82))
    
    # Pin border (white)
    draw.polygon(pin_points, outline=(255, 255, 255), width=8)
    
    # Pin center (white circle)
    draw.ellipse(
        [(pin_x - 35, pin_y - 65), (pin_x + 35, pin_y + 5)],
        fill=(255, 255, 255)
    )
    
    # Pin center dot (red)
    draw.ellipse(
        [(pin_x - 18, pin_y - 48), (pin_x + 18, pin_y - 12)],
        fill=(255, 82, 82)
    )
    
    # Navigation Compass
    arrow_x = size // 2 - 220
    arrow_y = size // 2 - 200
    
    # Compass circle (white)
    draw.ellipse(
        [(arrow_x - 70, arrow_y - 70), (arrow_x + 70, arrow_y + 70)],
        fill=(255, 255, 255)
    )
    
    # Compass border (blue)
    draw.ellipse(
        [(arrow_x - 70, arrow_y - 70), (arrow_x + 70, arrow_y + 70)],
        outline=(25, 118, 210),
        width=6
    )
    
    # North arrow (green)
    north_arrow = [
        (arrow_x, arrow_y - 45),
        (arrow_x + 20, arrow_y + 5),
        (arrow_x, arrow_y - 10),
        (arrow_x - 20, arrow_y + 5)
    ]
    draw.polygon(north_arrow, fill=(76, 175, 80))
    
    # Text at bottom
    try:
        font_large = ImageFont.truetype("arial.ttf", 72)
        font_small = ImageFont.truetype("arial.ttf", 48)
    except:
        font_large = ImageFont.load_default()
        font_small = ImageFont.load_default()
    
    # MUST text
    text = "MUST"
    bbox = draw.textbbox((0, 0), text, font=font_large)
    text_width = bbox[2] - bbox[0]
    draw.text(
        ((size - text_width) // 2, size - 140),
        text,
        fill=(255, 255, 255),
        font=font_large
    )
    
    # Smart Campus text
    text2 = "Smart Campus"
    bbox2 = draw.textbbox((0, 0), text2, font=font_small)
    text_width2 = bbox2[2] - bbox2[0]
    draw.text(
        ((size - text_width2) // 2, size - 80),
        text2,
        fill=(255, 255, 255),
        font=font_small
    )
    
    # Save icon
    output_dir = 'lib/assets/icons'
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, 'app_icon.png')
    
    img.save(output_path, 'PNG', quality=100)
    print(f"✅ Icon created successfully!")
    print(f"📁 Location: {output_path}")
    print(f"📏 Size: 1024x1024")
    print(f"\n🎨 Icon Features:")
    print("   🏛️ Campus building")
    print("   📍 Red location pin")
    print("   🧭 Green navigation compass")
    print("   🔵 Blue gradient background")
    print("\n✅ Ready to use!")
    print("\nNext step: Run setup_icon_complete.bat")

if __name__ == '__main__':
    create_campus_icon()
