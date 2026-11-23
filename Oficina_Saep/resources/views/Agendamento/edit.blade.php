<!DOCTYPE html>
<html>
<head>
    <title>Editar Agendamento</title>
</head>
<body>

    <h1>Editar Agendamento</h1>

    <form action="/agendamentos/{{ $agendamento->id }}" method="POST">

        @csrf
        @method('PUT')

        <label>Data:</label>

        <input
            type="date"
            name="data"
            value="{{ $agendamento->data }}"
        >

        <br><br>

        <label>Hora:</label>

        <input
            type="time"
            name="hora"
            value="{{ $agendamento->hora }}"
        >

        <br><br>

        <label>Descrição:</label>

        <input
            type="text"
            name="descricao"
            value="{{ $agendamento->descricao }}"
        >

        <br><br>

        <label>Pet:</label>

        <select name="pet_id">

            @foreach($pets as $pet)

                <option
                    value="{{ $pet->id }}"
                    {{ $agendamento->pet_id == $pet->id ? 'selected' : '' }}
                >
                    {{ $pet->nome }}
                </option>

            @endforeach

        </select>

        <br><br>

        <button type="submit">
            Salvar
        </button>

    </form>

    <br>

    <a href="/agendamentos/listar">
        Voltar
    </a>

</body>
</html>