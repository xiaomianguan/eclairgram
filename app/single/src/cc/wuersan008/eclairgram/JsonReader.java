package cc.wuersan008.eclairgram;

/**
 * 极简 JSON 拉取解析器（只解析，不建树）。
 *
 * 用途：直接一边读一边构建 Lottie 模型，避免 org.json 为整份 TGS JSON 建一棵
 * 临时对象树——那是老设备（16MB 堆）上解析动图贴纸时最大的内存峰值来源。
 *
 * 只支持 JSON 规范里的东西，够 Lottie 用即可；非法输入尽量容错（返回 0/空）。
 */
final class JsonReader {

    private final String s;
    private final int n;
    private int i;

    JsonReader(String s) {
        this.s = s;
        this.n = s.length();
    }

    private void ws() {
        while (i < n) {
            char c = s.charAt(i);
            if (c == ' ' || c == '\t' || c == '\n' || c == '\r') i++;
            else break;
        }
    }

    /** 跳过空白后的当前字符（不消费）。 */
    char peek() {
        ws();
        return i < n ? s.charAt(i) : '\0';
    }

    boolean tryConsume(char c) {
        ws();
        if (i < n && s.charAt(i) == c) { i++; return true; }
        return false;
    }

    boolean enterObject() {
        return tryConsume('{');
    }

    /** 返回下一个成员名；读到 '}' 时消费它并返回 null。 */
    String nextName() {
        ws();
        if (i < n && s.charAt(i) == '}') { i++; return null; }
        if (i < n && s.charAt(i) == ',') i++;
        String name = string();
        ws();
        if (i < n && s.charAt(i) == ':') i++;
        return name;
    }

    boolean enterArray() {
        return tryConsume('[');
    }

    /** 数组里是否还有下一个元素；读到 ']' 时消费它并返回 false。 */
    boolean hasNext() {
        ws();
        if (i < n && s.charAt(i) == ']') { i++; return false; }
        if (i < n && s.charAt(i) == ',') i++;
        return true;
    }

    String string() {
        ws();
        if (i >= n || s.charAt(i) != '"') return "";
        i++;
        StringBuilder sb = new StringBuilder();
        while (i < n) {
            char c = s.charAt(i++);
            if (c == '"') break;
            if (c == '\\') {
                if (i >= n) break;
                char e = s.charAt(i++);
                switch (e) {
                    case '"': sb.append('"'); break;
                    case '\\': sb.append('\\'); break;
                    case '/': sb.append('/'); break;
                    case 'b': sb.append('\b'); break;
                    case 'f': sb.append('\f'); break;
                    case 'n': sb.append('\n'); break;
                    case 'r': sb.append('\r'); break;
                    case 't': sb.append('\t'); break;
                    case 'u':
                        if (i + 4 <= n) {
                            sb.append((char) Integer.parseInt(s.substring(i, i + 4), 16));
                            i += 4;
                        }
                        break;
                    default: sb.append(e);
                }
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    double number() {
        ws();
        int start = i;
        while (i < n) {
            char c = s.charAt(i);
            if (c == '-' || c == '+' || c == '.' || c == 'e' || c == 'E'
                    || (c >= '0' && c <= '9')) i++;
            else break;
        }
        if (i == start) return 0;
        try {
            return Double.parseDouble(s.substring(start, i));
        } catch (Throwable t) {
            return 0;
        }
    }

    boolean bool() {
        ws();
        if (i < n && s.charAt(i) == 't') { i += 4; return true; }
        if (i < n && s.charAt(i) == 'f') { i += 5; return false; }
        return false;
    }

    /** 跳过任意一个值（对象/数组/字符串/数字/true/false/null）。 */
    void skipValue() {
        ws();
        if (i >= n) return;
        char c = s.charAt(i);
        if (c == '{') skipComposite('{', '}');
        else if (c == '[') skipComposite('[', ']');
        else if (c == '"') string();
        else {
            while (i < n) {
                char d = s.charAt(i);
                if (d == ',' || d == '}' || d == ']' || d == ' ' || d == '\t'
                        || d == '\n' || d == '\r') break;
                i++;
            }
        }
    }

    private void skipComposite(char open, char close) {
        int depth = 0;
        boolean inStr = false;
        while (i < n) {
            char c = s.charAt(i++);
            if (inStr) {
                if (c == '\\') i++;
                else if (c == '"') inStr = false;
            } else if (c == '"') {
                inStr = true;
            } else if (c == open) {
                depth++;
            } else if (c == close) {
                depth--;
                if (depth == 0) return;
            }
        }
    }
}
