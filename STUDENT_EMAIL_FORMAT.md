# 📧 MUST Student Email Format

## ✅ **Updated Email Validation**

The registration system now uses the **official MUST student email format**.

---

## 📝 **Email Format**

### **Pattern:**
```
YYYYprogramNNN@std.must.ac.ug
```

### **Components:**
- **YYYY** = Year of admission (4 digits)
- **program** = Program code (2-10 letters)
- **NNN** = Student number (3-4 digits)
- **@std.must.ac.ug** = Student domain (required)

---

## 📚 **Examples**

### **Valid Student Emails:**

| Email | Breakdown |
|-------|-----------|
| `2023bit040@std.must.ac.ug` | 2023 + BIT + 040 |
| `2024bcs001@std.must.ac.ug` | 2024 + BCS + 001 |
| `2022mbr123@std.must.ac.ug` | 2022 + MBR + 123 |
| `2023pha050@std.must.ac.ug` | 2023 + PHA + 050 |
| `2021bns200@std.must.ac.ug` | 2021 + BNS + 200 |
| `2024bba015@std.must.ac.ug` | 2024 + BBA + 015 |
| `2023engineering100@std.must.ac.ug` | 2023 + ENGINEERING + 100 |

### **Invalid Emails (Will Be Rejected):**

❌ `student@must.ac.ug` - Wrong domain
❌ `2023bit040@students.must.ac.ug` - Wrong domain
❌ `2023bit040@mbarara.ac.ug` - Wrong domain
❌ `bit040@std.must.ac.ug` - Missing year
❌ `2023@std.must.ac.ug` - Missing program and number
❌ `john.doe@std.must.ac.ug` - Wrong format

---

## 🎯 **Program Codes**

Common program codes used in emails:

### **Computing & IT:**
- `bit` - Bachelor of Information Technology
- `bcs` - Bachelor of Computer Science
- `bse` - Bachelor of Software Engineering

### **Medicine & Health:**
- `mbr` - Bachelor of Medicine
- `pha` - Pharmacy
- `bns` - Bachelor of Nursing Science
- `mls` - Medical Laboratory Sciences
- `bsp` - Bachelor of Physiotherapy

### **Business:**
- `bba` - Bachelor of Business Administration
- `bsaf` - Bachelor of Accounting & Finance
- `bpsm` - Bachelor of Procurement & Supply Management
- `eco` - Economics

### **Engineering:**
- `bme` - Biomedical Engineering
- `eee` - Electrical & Electronics Engineering
- `civ` - Civil Engineering
- `mie` - Mechanical & Industrial Engineering
- `pem` - Petroleum Engineering

### **Sciences:**
- `biology` - Biology
- `chemistry` - Chemistry
- `physics` - Physics
- `maths` - Mathematics

---

## 🔧 **Validation Rules**

The system validates:

1. ✅ **Year**: Must be 4 digits (e.g., 2023, 2024)
2. ✅ **Program**: Must be 2-10 letters (e.g., bit, bcs, engineering)
3. ✅ **Number**: Must be 3-4 digits (e.g., 040, 001, 1234)
4. ✅ **Domain**: Must be exactly `@std.must.ac.ug`
5. ✅ **Case**: Case-insensitive (BIT, bit, Bit all work)

---

## 📱 **Registration Example**

### **Student Information:**
- **Name:** John Doe
- **Year:** 2023
- **Program:** BIT (Bachelor of Information Technology)
- **Student Number:** 040

### **Email to Use:**
```
2023bit040@std.must.ac.ug
```

### **Registration Form:**
```
Full Name: John Doe
Student ID: 2023/BIT/040
Email: 2023bit040@std.must.ac.ug
Program: BIT I
Password: SecurePass123
Confirm Password: SecurePass123
☑ I agree to Terms and Conditions
```

---

## 🧪 **Testing**

### **Test Accounts:**

You can test with these formats:

```
2024bit001@std.must.ac.ug
2024bcs002@std.must.ac.ug
2023mbr003@std.must.ac.ug
2023pha004@std.must.ac.ug
2024bba005@std.must.ac.ug
```

---

## 🔐 **Security Notes**

### **Email Verification:**
- After registration, a verification email is sent
- Students must verify their email before logging in
- Verification link is sent to the registered email

### **Password Requirements:**
- Minimum 8 characters
- At least one uppercase letter
- At least one lowercase letter
- At least one number

---

## 🆘 **Common Issues**

### **Issue: "Invalid email format"**

**Cause:** Email doesn't match the required pattern

**Solution:** Use format: `YYYYprogramNNN@std.must.ac.ug`

**Example:** `2023bit040@std.must.ac.ug`

### **Issue: "Please use your MUST student email"**

**Cause:** Email doesn't end with `@std.must.ac.ug`

**Solution:** Make sure email ends with `@std.must.ac.ug` (not `@must.ac.ug` or other domains)

### **Issue: "Email already in use"**

**Cause:** This email is already registered

**Solution:** Use the login page instead, or use password reset if you forgot your password

---

## 📊 **Email Format Breakdown**

```
2023bit040@std.must.ac.ug
│   │  │  │
│   │  │  └─ Domain (required: @std.must.ac.ug)
│   │  └──── Student number (3-4 digits)
│   └─────── Program code (2-10 letters)
└─────────── Year (4 digits)
```

---

## ✅ **Validation Examples**

### **Valid:**
```javascript
✓ 2023bit040@std.must.ac.ug
✓ 2024BCS001@std.must.ac.ug (case insensitive)
✓ 2022engineering100@std.must.ac.ug (long program name)
✓ 2021mb123@std.must.ac.ug (short program name)
```

### **Invalid:**
```javascript
✗ student@must.ac.ug (wrong format)
✗ 2023bit@std.must.ac.ug (missing number)
✗ bit040@std.must.ac.ug (missing year)
✗ 2023bit040@gmail.com (wrong domain)
✗ 23bit040@std.must.ac.ug (year too short)
```

---

## 🎓 **For Students**

When registering:

1. **Use your official MUST student email**
2. **Format:** `YYYYprogramNNN@std.must.ac.ug`
3. **Example:** If you're a 2023 BIT student with number 040, use: `2023bit040@std.must.ac.ug`
4. **Check your email** for verification link after registration
5. **Verify your email** before attempting to login

---

## 🔄 **Migration Note**

If you previously registered with a different email format:

1. The old format is no longer accepted
2. You need to register again with the correct format
3. Use your official MUST student email: `YYYYprogramNNN@std.must.ac.ug`

---

## 📞 **Support**

If you don't know your student email format:

1. Check your student ID card
2. Contact the IT department
3. Check your admission letter
4. Ask your program coordinator

**Your student email follows the pattern on your student ID!**

---

## ✅ **Summary**

- ✅ **Only** `@std.must.ac.ug` emails accepted
- ✅ Format: `YYYYprogramNNN@std.must.ac.ug`
- ✅ Example: `2023bit040@std.must.ac.ug`
- ✅ Case insensitive
- ✅ Email verification required
- ✅ Strong password required

**Use your official MUST student email to register!** 🎓
